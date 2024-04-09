import Foundation

public struct LoadUserIDUseCaseImpl: LoadUserIDUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func callAsFunction() -> String {
        authRepository.loadUserID()
    }
}
