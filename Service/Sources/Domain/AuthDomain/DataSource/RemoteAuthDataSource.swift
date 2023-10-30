import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    func logout() async throws {
        try await request(.logout)
    }

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
