import Foundation

public struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction(req: ChangePasswordRequestDTO) async throws {
        try await userRepository.changePassword(req: req)
    }
}
