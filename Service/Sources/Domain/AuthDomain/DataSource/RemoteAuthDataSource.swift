import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    func login(req: LoginRequestDTO) async throws {
        try await request(.login(req))
    }

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
