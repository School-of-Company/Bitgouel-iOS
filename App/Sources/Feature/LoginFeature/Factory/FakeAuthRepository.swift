import Foundation
import Service

class FakeAuthRepository: AuthRepository {
    func login(req: LoginRequestDTO) async throws {}
    func reissueToken() async throws {}
    func logout() async throws {}
    func withdraw() async throws {}
    func studentSignup(req: Service.StudentSignupRequestDTO) async throws {}
    func teacherSignup(req: Service.TeacherSignupRequestDTO) async throws {}
    func bbozzakSignup(req: Service.BbozzakSignupRequestDTO) async throws {}
    func professorSignup(req: Service.ProfessorSignupRequestDTO) async throws {}
    func governmentSignup(req: Service.GovernmentSignupRequestDTO) async throws {}
    func companyInstructorSignup(req: Service.CompanyInstructorSignupRequestDTO) async throws {}
}
