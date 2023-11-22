import Foundation

public struct ProfessorSignupUseCaseImpl: ProfessorSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: ProfessorSignupRequestDTO) async throws {
        try await authRepository.professorSignup(req: req)
    }
}
