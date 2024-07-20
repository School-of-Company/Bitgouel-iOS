import Foundation

public struct FetchGovernmentUseCaseImpl: FetchGovernmentListUseCase {
    private let governmentRepository: any GovernmentRepository

    public init(governmentRepository: any GovernmentRepository) {
        self.governmentRepository = governmentRepository
    }

    public func callAsFunction() async throws -> [GovernmentInfoEntity] {
        try await governmentRepository.fetchGovernmentList()
    }
}
