import Foundation

public struct SaveUserIDUseCaseImpl: SaveUserIDUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(id: String) {
        authRepository.saveUserID(id: id)
    }
}
