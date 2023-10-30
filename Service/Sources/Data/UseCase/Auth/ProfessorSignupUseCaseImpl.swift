import Foundation

struct ProfessorSignupUseCaseImpl: ProfessorSignupUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func callAsFunction(req: ProfessorSignupRequestDTO) async throws {
        try await authRepository.professorSignup(req: req)
    }
}
