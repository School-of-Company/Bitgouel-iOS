import Foundation

public final class RemoteSchoolDataSourceImpl: BaseRemoteDataSource<SchoolAPI>, RemoteSchoolDataSource {
    public func fetchSchoolList() async throws -> [SchoolListEntity] {
        try await request(.fetchSchoolList, dto: FetchSchoolListResponseDTO.self).toDomain()
    }

    public func fetchAllSchoolName() async throws -> [String] {
        try await request(.fetchAllSchoolName, dto: FetchSchoolNameResponseDTO.self).toDomain()
    }

    public func createdSchool(logoImage: Data, req: InputSchoolInfoRequestDTO) async throws {
        try await request(.createdSchool(logoImage: logoImage, req: req))
    }

    public func modifySchool(schoolID: Int, logoImage: Data, req: InputSchoolInfoRequestDTO) async throws {
        try await request(.modifySchool(schoolID: schoolID, logoImage: logoImage, req: req))
    }

    public func deleteSchool(schoolID: Int) async throws {
        try await request(.deleteSchool(schoolID: schoolID))
    }

    public func fetchSchoolDetail(schoolID: Int) async throws -> SchoolListEntity {
        try await request(.fetchSchoolDetail(schoolID: schoolID), dto: SchoolListResponseDTO.self).toDomain()
    }
}
