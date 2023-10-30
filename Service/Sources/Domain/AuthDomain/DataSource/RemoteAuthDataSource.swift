import Foundation

final class RemoteAuthDataSource: BaseRemoteDataSource<AuthAPI> {
    func login(req: LoginRequestDTO) async throws {
        try await request(.login(req))
    }

    func reissueToken() async throws {
        try await request(.reissueToken)
    }

    func logout() async throws {
        try await request(.logout)
    }

    func withdraw() async throws {
        try await request(.withdraw)
    }

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }
}
