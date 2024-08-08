import Foundation

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func fetchSchoolList() async throws -> [SchoolListEntity] {
        try await request(.fetchSchoolList, dto: FetchSchoolListResponseDTO.self).toDomain()
    }

    public func fetchAllSchoolName() async throws -> [String] {
        try await request(.fetchAllSchoolName, dto: FetchSchoolNameResponseDTO.self).toDomain()
    }

    public func createdSchool(req: CreatedSchoolRequestDTO) async throws {
        try await request(.createdSchool(req: req))
    }

    public func modifySchool(schoolID: Int, req: ModifySchoolRequestDTO) async throws {
        try await request(.modifySchool(schoolID: schoolID, req: req))
    }

    public func deleteSchool(schoolID: Int) async throws {
        try await request(.deleteSchool(schoolID: schoolID))
    }
}
