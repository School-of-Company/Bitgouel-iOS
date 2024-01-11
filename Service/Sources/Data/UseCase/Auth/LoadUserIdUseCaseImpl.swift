import Foundation

public struct LoadUserIdUseCaseImpl: LoadUserIdUseCase {
    private let authRepository: any AuthRepository
    
    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func callAsFunction() -> String {
        authRepository.loadUserId()
    }
}
