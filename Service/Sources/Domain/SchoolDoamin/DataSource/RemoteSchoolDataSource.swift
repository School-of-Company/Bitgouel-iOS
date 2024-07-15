import Foundation

public protocol RemoteSchoolDataSource: BaseRemoteDataSource<SchoolAPI> {
    func fetchSchoolList() async throws -> [SchoolListEntity]
    func fetchAllSchoolName() async throws -> [String]
    func createdSchool(req: CreatedSchoolRequestDTO) async throws
    func modifySchool(schoolID: String, req: ModifySchoolRequestDTO) async throws
    func deleteSchool(schoolID: String) async throws
}
