import Foundation

public struct SchoolRepositoryImpl: SchoolRepository {
    private let remoteSchoolDataSource: any RemoteSchoolDataSource

    public init(remoteSchoolDataSource: any RemoteSchoolDataSource) {
        self.remoteSchoolDataSource = remoteSchoolDataSource
    }

    public func fetchSchoolList() async throws -> [SchoolListEntity] {
        try await remoteSchoolDataSource.fetchSchoolList()
    }

    public func fetchAllSchoolName() async throws -> [String] {
        try await remoteSchoolDataSource.fetchAllSchoolName()
    }

    public func createdSchool(req: CreatedSchoolRequestDTO) async throws {
        try await remoteSchoolDataSource.createdSchool(req: req)
    }

    public func modifySchool(schoolID: Int, req: ModifySchoolRequestDTO) async throws {
        try await remoteSchoolDataSource.modifySchool(schoolID: schoolID, req: req)
    }

    public func deleteSchool(schoolID: Int) async throws {
        try await remoteSchoolDataSource.deleteSchool(schoolID: schoolID)
    }
}
