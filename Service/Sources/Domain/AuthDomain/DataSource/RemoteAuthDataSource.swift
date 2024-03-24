import Foundation

public protocol RemoteAuthDataSource {
    var keychain: Keychain { get }
    func login(req: LoginRequestDTO) async throws -> UserLoginEntity
    func reissueToken() async throws
    func logout(accessToken: String, refreshToken: String) async throws
    func withdraw() async throws
    func studentSignup(req: StudentSignupRequestDTO) async throws
    func teacherSignup(req: TeacherSignupRequestDTO) async throws
    func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws
    func professorSignup(req: ProfessorSignupRequestDTO) async throws
    func governmentSignup(req: GovernmentSignupRequestDTO) async throws
    func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws
    func findPassword(req: FindPasswordRequestDTO) async throws
}
