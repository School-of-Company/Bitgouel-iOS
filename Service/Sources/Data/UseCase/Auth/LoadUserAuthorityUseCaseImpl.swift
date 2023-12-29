import Foundation

public struct LoadUserAuthorityUseCaseImpl: LoadUserAuthorityUseCase {
    private let authRepository: AuthRepository

    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction() -> UserAuthorityType {
        authRepository.loadUserAuthority()
    }
}
