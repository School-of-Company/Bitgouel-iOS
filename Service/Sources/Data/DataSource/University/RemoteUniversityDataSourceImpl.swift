import Foundation

public final class RemoteUniversityDataSourceImpl: BaseRemoteDataSource<UniversityAPI>, RemoteUniversityDataSource {
    public func fetchUniversityList() async throws -> [UniversityInfoEntity] {
        try await request(.fetchUniversityList, dto: UniversityListResponseDTO.self).toDomain()
    }
    
    public func createdUniversity(req: UniversityNameRequestDTO) async throws {
        try await request(.createdUniversity(req: req))
    }
    
    public func modifyUniversity(universityID: String, req: UniversityNameRequestDTO) async throws {
        try await request(.modifyUniversity(universityID: universityID, req: req))
    }
    
    public func deleteUniversity(universityID: String) async throws {
        try await request(.deleteUniversity(universityID: universityID))
    }
    
    public func createdDepartment(universityID: String, req: DepartmentRequestDTO) async throws {
        try await request(.createdDepartment(universityID: universityID, req: req))
    }
    
    public func deleteDepartment(universityID: String, department: String) async throws {
        try await request(.deleteDepartment(universityID: universityID, department: department))
    }
}
