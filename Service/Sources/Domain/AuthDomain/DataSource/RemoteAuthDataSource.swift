import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
