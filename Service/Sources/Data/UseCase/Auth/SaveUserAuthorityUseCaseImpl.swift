import Foundation

public struct SaveUserAuthorityUseCaseImpl: SaveUserAuthorityUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(authority: UserAuthorityType) {
        authRepository.saveUserAuthority(authority: authority)
    }
}
