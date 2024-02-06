import Foundation

public struct LoadUserAuthorityUseCaseImpl: LoadUserAuthorityUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction() -> UserAuthorityType {
        authRepository.loadUserAuthority()
    }
}
