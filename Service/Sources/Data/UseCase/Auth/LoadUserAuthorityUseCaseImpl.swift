import Foundation

public struct LoadUserAuthorityUseCaseImpl: LoadUserAuthorityUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFuntion() -> UserAuthorityType {
        authRepository.loadUserAuthority()
    }
}
