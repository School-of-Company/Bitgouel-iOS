import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: RemoteAuthDataSource
    
    init(
        remoteAuthDataSource: RemoteAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }
    
    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await remoteAuthDataSource.studentSignup(req: req)
    }
}