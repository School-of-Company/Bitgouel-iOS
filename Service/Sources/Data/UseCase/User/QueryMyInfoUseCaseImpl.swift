import Foundation

public struct QueryMyInfoUseCaseImpl: QueryMyInfoUseCase {
    private let userRepository: any UserRepository
    
    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }
    
    public func callAsFunction() async throws -> MyInfoEntity {
        userRepository.queryMyInfo()
    }
}
