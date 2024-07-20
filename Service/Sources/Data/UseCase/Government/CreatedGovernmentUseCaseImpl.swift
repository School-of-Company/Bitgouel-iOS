import Foundation

public struct CreatedGovernmentUseCaseImpl: CreatedGovernmentUseCase {
    private let governmentRepository: any GovernmentRepository

    public init(governmentRepository: any GovernmentRepository) {
        self.governmentRepository = governmentRepository
    }

    public func callAsFunction(req: CreatedGovernmentRequestDTO) async throws {
        try await governmentRepository.createdGovernment(req: req)
    }
}
