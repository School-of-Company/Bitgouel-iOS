import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    func reissueToken() async throws {
        try await request(.reissueToken)
    }

    func logout() async throws {
        try await request(.logout)
    }

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
