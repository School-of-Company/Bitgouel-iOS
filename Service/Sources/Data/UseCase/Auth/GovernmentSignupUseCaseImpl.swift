import Foundation

public struct GovernmentSignupUseCaseImpl: GovernmentSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: GovernmentSignupRequestDTO) async throws {
        try await authRepository.governmentSignup(req: req)
    }
}
