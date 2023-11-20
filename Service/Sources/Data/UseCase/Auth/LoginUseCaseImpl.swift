import Foundation

public struct LoginUseCaseImpl: LoginUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: LoginRequestDTO) async throws {
        try await authRepository.login(req: req)
    }
}
