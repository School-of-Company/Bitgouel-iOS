import Foundation

public struct DeleteGovernmentUseCaseImpl: DeleteGovernmentUseCase {
    private let governmentRepository: any GovernmentRepository

    public init(governmentRepository: any GovernmentRepository) {
        self.governmentRepository = governmentRepository
    }

    public func callAsFunction(governmentID: Int) async throws {
        try await governmentRepository.deleteGovernment(governmentID: governmentID)
    }
}
