import Foundation

public struct WithdrawalUseCaseImpl: WithdrawalUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction() async throws {
        try await authRepository.withdraw()
    }
}
