import Foundation

public protocol GovernmentRepository {
    func fetchGovernmentList() async throws -> [GovernmentInfoEntity]
    func createdGovernment(req: CreatedGovernmentRequestDTO) async throws
    func deleteGovernment(governmentID: Int) async throws
}
