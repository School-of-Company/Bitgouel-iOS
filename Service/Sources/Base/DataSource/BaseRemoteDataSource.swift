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
        let response = try await retryingRequest(api)
        return try decoder.decode(dto, from: response.data)
    }

    public func request(_ api: API) async throws {
        try await retryingRequest(api)
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
