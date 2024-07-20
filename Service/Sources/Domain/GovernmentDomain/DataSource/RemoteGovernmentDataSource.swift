import Foundation

public protocol RemoteGovernmentDataSource: BaseRemoteDataSource<GovernmentAPI> {
    func fetchGovernmentList() async throws -> [GovernmentInfoEntity]
    func createdGovernment(req: CreatedGovernmentRequestDTO) async throws
    func deleteGovernment(governmentID: Int) async throws
}
