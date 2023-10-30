import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource
    private let localAuthDataSource: LocalAuthDataSource

    init(
        remoteAuthDataSource: RemoteAuthDataSource,
        localAuthDataSource: LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    public func login(req: LoginRequestDTO) async throws {
        try await remoteAuthDataSource.login(req: req)
    }

    public func reissueToken() async throws {
        try await remoteAuthDataSource.reissueToken()
    }

    public func logout() async throws {
        try await remoteAuthDataSource.logout()
        try await localAuthDataSource.logout()
    }

    public func withdraw() async throws {
        try await remoteAuthDataSource.withdraw()
        try await localAuthDataSource.withdraw()
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }
}
