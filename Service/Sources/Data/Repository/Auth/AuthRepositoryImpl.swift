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

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }
}
