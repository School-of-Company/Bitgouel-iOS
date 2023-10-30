import Foundation

public protocol TeacherSignupUseCase {
    func callAsFuntion(req: TeacherSignupRequestDTO) async throws
}
