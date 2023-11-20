import Foundation

struct GovernmentSignupUseCaseImpl: GovernmentSignupUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func callAsFunction(req: GovernmentSignupRequestDTO) async throws {
        try await authRepository.governmentSignup(req: req)
    }
}
