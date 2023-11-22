import Foundation

public struct CompanyInstructorSignupUseCaseImpl: CompanyInstructorSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: CompanyInstructorSignupRequestDTO) async throws {
        try await authRepository.companyInstructorSignup(req: req)
    }
}
