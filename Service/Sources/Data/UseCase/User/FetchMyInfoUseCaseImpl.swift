import Foundation

public struct FetchMyInfoUseCaseImpl: FetchMyInfoUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func callAsFunction() async throws -> MyInfoEntity {
        try await userRepository.fetchMyInfo()
    }
}
