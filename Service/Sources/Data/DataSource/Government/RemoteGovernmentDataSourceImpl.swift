import Foundation

public final class RemoteGovernmentDataSourceImpl: BaseRemoteDataSource<GovernmentAPI>, RemoteGovernmentDataSource {
    public func fetchGovernmentList() async throws -> [GovernmentInfoEntity] {
        try await request(.fetchGovernmentList, dto: GovernmentListResponseDTO.self).toDomain()
    }

    public func createdGovernment(req: CreatedGovernmentRequestDTO) async throws {
        try await request(.createdGovernment(req: req))
    }

    public func deleteGovernment(governmentID: Int) async throws {
        try await request(.deleteGovernment(governmentID: governmentID))
    }
}
