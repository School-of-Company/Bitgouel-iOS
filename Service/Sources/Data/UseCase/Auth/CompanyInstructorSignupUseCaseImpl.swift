import Foundation

struct CompanyInstructorSignupUseCaseImpl: CompanyInstructorSignupUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func callAsFunction(req: CompanyInstructorSignupRequestDTO) async throws {
        try await authRepository.companyInstructorSignup(req: req)
    }
}
