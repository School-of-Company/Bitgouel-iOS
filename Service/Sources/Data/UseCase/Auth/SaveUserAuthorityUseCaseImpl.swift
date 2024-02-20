import Foundation

public struct SaveUserAuthorityUseCaseImpl: SaveUserAuthorityUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction(authority: UserAuthorityType) {
        authRepository.saveUserAuthority(authority: authority)
    }
}
