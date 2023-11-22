import Foundation

public struct BbozzakSingupUseCaseImpl: BbozzakSignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: BbozzakSignupRequestDTO) async throws {
        try await authRepository.bbozzakSignup(req: req)
    }
}
