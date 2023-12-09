import Foundation

public final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public func login(req: LoginRequestDTO) async throws {
        try await request(.login(req))
    }

    public func reissueToken() async throws {
        try await request(.reissueToken)
    }

    public func logout() async throws {
        try await request(.logout)
    }

    public func withdraw() async throws {
        try await request(.withdraw)
    }

    public func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req))
    }

    public func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await request(.teacherSignup(req))
    }

    public func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws {
        try await request(.bbozzakSignup(req))
    }

    public func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await request(.professorSignup(req))
    }

    public func governmentSignup(req: GovernmentSignupRequestDTO) async throws {
        try await request(.governmentSignup(req))
    }

    public func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await request(.companyInstructorSignup(req))
    }
}
