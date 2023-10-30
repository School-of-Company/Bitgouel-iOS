import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource

    init(
        remoteAuthDataSource: RemoteAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    public func login(req: LoginRequestDTO) async throws {
        try await remoteAuthDataSource.login(req: req)
    }

    public func reissueToken() async throws {
        try await remoteAuthDataSource.reissueToken()
    }

    public func logout() async throws {
        try await remoteAuthDataSource.logout()
    }
    
    public func withdraw() async throws {
        try await remoteAuthDataSource.withdraw()
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }
}
