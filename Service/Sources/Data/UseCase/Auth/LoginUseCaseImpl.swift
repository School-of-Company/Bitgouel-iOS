import Foundation

public struct LoginUseCaseImpl: LoginUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: LoginRequestDTO) async throws -> UserLoginEntity {
        try await authRepository.login(req: req)
    }
}
