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

    func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await request(.teacherSignup(req))
    }

    func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await request(.professorSignup(req))
    }

    
    func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await request(.companyInstructorSignup(req))
    }
    
    func governmentSignup(req: GovernmentSignupRequestDTO) async throws {
        try await request(.governmentSignup(req))
    }
}
