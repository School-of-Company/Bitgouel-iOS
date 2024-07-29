import Foundation

public struct UniversityRepositoryImpl: UniversityRepository {
    private let remoteUniversityDataSource: any RemoteUniversityDataSource

    public init(remoteUniversityDataSource: any RemoteUniversityDataSource) {
        self.remoteUniversityDataSource = remoteUniversityDataSource
    }

    public func fetchUniversityList() async throws -> [UniversityInfoEntity] {
        try await remoteUniversityDataSource.fetchUniversityList()
    }

    public func createdUniversity(req: UniversityNameRequestDTO) async throws {
        try await remoteUniversityDataSource.createdUniversity(req: req)
    }

    public func modifyUniversity(universityID: Int, req: UniversityNameRequestDTO) async throws {
        try await remoteUniversityDataSource.modifyUniversity(universityID: universityID, req: req)
    }

    public func deleteUniversity(universityID: Int) async throws {
        try await remoteUniversityDataSource.deleteUniversity(universityID: universityID)
    }

    public func createdDepartment(universityID: Int, req: DepartmentRequestDTO) async throws {
        try await remoteUniversityDataSource.createdDepartment(universityID: universityID, req: req)
    }

    public func deleteDepartment(universityID: Int, department: String) async throws {
        try await remoteUniversityDataSource.deleteDepartment(universityID: universityID, department: department)
    }
}
