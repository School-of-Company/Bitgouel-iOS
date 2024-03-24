import Foundation

public struct FindPasswordUseCaseImpl: FindPasswordUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(email: String, newPassword: String) async throws {
        try await authRepository.findPassword(email: email, newPassword: newPassword)
    }
}
