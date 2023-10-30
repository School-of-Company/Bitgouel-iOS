import Foundation

struct TeacherSignupUseCaseImpl: TeacherSignupUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func callAsFuntion(req: TeacherSignupRequestDTO) async throws {
        try await authRepository.teacherSignup(req: req)
    }
}
