import Foundation

public protocol RemoteAuthDataSource {
    func login(req: LoginRequestDTO) async throws
    func reissueToken() async throws
    func logout() async throws
    func withdraw() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
    func teacherSignup(req: TeacherSignupRequestDTO) async throws
    func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws
    func professorSignup(req: ProfessorSignupRequestDTO) async throws
    func governmentSignup(req: GovernmentSignupRequestDTO) async throws
    func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws
}
