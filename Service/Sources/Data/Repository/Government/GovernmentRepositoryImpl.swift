import Foundation

public struct GovernmentRepositoryImpl: GovernmentRepository {
    private let remoteGovernmentDataSource: any RemoteGovernmentDataSource

    public init(remoteGovernmentDataSource: any RemoteGovernmentDataSource) {
        self.remoteGovernmentDataSource = remoteGovernmentDataSource
    }

    public func fetchGovernmentList() async throws -> [GovernmentInfoEntity] {
        try await remoteGovernmentDataSource.fetchGovernmentList()
    }

    public func createdGovernment(req: CreatedGovernmentRequestDTO) async throws {
        try await remoteGovernmentDataSource.createdGovernment(req: req)
    }

    public func deleteGovernment(governmentID: Int) async throws {
        try await remoteGovernmentDataSource.deleteGovernment(governmentID: governmentID)
    }
}
