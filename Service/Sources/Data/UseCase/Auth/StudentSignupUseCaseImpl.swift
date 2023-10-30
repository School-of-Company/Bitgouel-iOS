import Foundation

struct StudentSignupUseCaseImpl: StudentSignupUseCase {
    private let authRepository: any AuthRepository
    
    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(req: StudentSignupRequestDTO) async throws {
        try await authRepository.studentSignup(req: req)
    }
}
