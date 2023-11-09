import Foundation

struct BbozzakSingupUseCaseImpl: BbozzakSignupUseCase {
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    func callAsFunction(req: BbozzakSignupRequestDTO) async throws {
        try await authRepository.bbozzakSignup(req: req)
    }
}
