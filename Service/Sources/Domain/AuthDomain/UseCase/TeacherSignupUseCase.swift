import Foundation

public protocol TeacherSignupUseCase {
    func callAsFunction(req: TeacherSignupRequestDTO) async throws
}
