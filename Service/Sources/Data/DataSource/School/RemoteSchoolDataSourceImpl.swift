import Foundation

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func fetchSchoolList() async throws -> [SchoolListEntity] {
        try await request(.fetchSchoolList, dto: FetchSchoolListResponseDTO.self).toDomain()
    }
}
