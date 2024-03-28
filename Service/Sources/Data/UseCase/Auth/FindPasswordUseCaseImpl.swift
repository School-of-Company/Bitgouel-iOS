import Foundation

public struct FindPasswordUseCaseImpl: FindPasswordUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(req: FindPasswordRequestDTO) async throws {
        try await authRepository.findPassword(req: req)
    }
}
