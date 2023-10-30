import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    
    func reissueToken() async throws {
        try await request(.reissueToken)
    }
    
    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
