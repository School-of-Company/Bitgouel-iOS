import Foundation

struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute() async throws {
        try await authRepository.reissueToken()
    }
}
