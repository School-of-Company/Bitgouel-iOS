import Foundation

public protocol CreatedGovernmentUseCase {
    func callAsFunction(req: CreatedGovernmentRequestDTO) async throws
}
