import Foundation
import Moya

open class BaseRemoteDataSource<API: BitgouelAPI> {
    private let keychain: any Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        keychain: any Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain

        #if DEV || STAGE
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), MoyaLoggingPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), MoyaLoggingPlugin()])
        #endif
    }

    public func request<T: Decodable>(_ api: API, dto: T.Type) async throws -> T {
        let response = try await defaultRequest(api)
        return try decoder.decode(dto, from: response.data)
    }

    public func request(_ api: API) async throws {
        _ = try await defaultRequest(api)
    }
    
    private func defaultRequest(_ api: API) async throws -> Response {
        if checkIsApiNeedsAuthorization(api) {
            return try await authorizedRequest(api)
        } else {
            return try await retryingRequest(api)
        }
    }
}

private extension BaseRemoteDataSource {
    @discardableResult
    func retryingRequest(_ api: API) async throws -> Response {
        try await _Concurrency.Task.retrying(
            priority: _Concurrency.Task.currentPriority,
            maxRetryCount: maxRetryCount
        ) {
            do {
                return try await self.provider.request(api: api)
            } catch {
                guard
                    let moyaError = error as? MoyaError,
                    let httpResponse = moyaError.response
                else {
                    throw error
                }
                throw api.errorMap[httpResponse.statusCode] ?? error
            }
        }
        .value
    }

    func authorizedRequest(_ api: API) async throws -> Response {
        if checkTokenIsExpired() {
            do {
                try await tokenReissue()
                let response = try await self.retryingRequest(api)
                return response
            } catch {
                throw error
            }
        } else {
            do {
                let response = try await self.retryingRequest(api)
                return response
            } catch {
                throw error
            }
        }
    }
    
    func checkIsApiNeedsAuthorization(_ api: API) -> Bool {
        let result = api.jwtTokenType == .accessToken
        return result
    }
    
    func checkTokenIsExpired() -> Bool {
        let expired = keychain.load(type: .accessExpiredAt).toBitgouelDate()
        return Date() > expired
    }
    
    func tokenReissue() async throws {
        let provider = MoyaProvider<RefreshAPI>(plugins: [JwtPlugin(keychain: keychain)])
        do {
            let response  = try await provider.request(api: .reissueToken)
        } catch {
            throw error
        }
    }
}

private extension MoyaProvider {
    func request(api: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(api, completion: continuation.resume(with:))
        }
    }
}

private extension _Concurrency.Task where Failure == Error {
    @discardableResult
    static func retrying(
        priority: TaskPriority? = nil,
        maxRetryCount: Int = 2,
        retryDelay: TimeInterval = 0.5,
        operation: @Sendable @escaping () async throws -> Success
    ) -> _Concurrency.Task<Success, Failure> {
        _Concurrency.Task(priority: priority) {
            for _ in 0..<maxRetryCount {
                do {
                    return try await operation()
                } catch {
                    let oneSecond = TimeInterval(1_000_000_000)
                    let delay = UInt64(oneSecond * retryDelay)
                    try await _Concurrency.Task<Never, Never>.sleep(nanoseconds: delay)
                    continue
                }
            }

            try _Concurrency.Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }
}

extension String {
    func toBitgouelDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }
}
