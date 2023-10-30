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

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }

    func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await request(.teacherSignup(req))
    }
}
