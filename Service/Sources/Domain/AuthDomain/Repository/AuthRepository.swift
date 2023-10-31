import Foundation

public protocol AuthRepository {
    func login(req: LoginRequestDTO) async throws
    func reissueToken() async throws
    func logout() async throws
    func withdraw() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
    func teacherSignup(req: TeacherSignupRequestDTO) async throws
    func professorSignup(req: ProfessorSignupRequestDTO) async throws
    func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws
    func governmentSignup(req: GovernmentSignupRequestDTO) async throws
}
