import Foundation

public protocol RemoteSchoolDataSource: BaseRemoteDataSource<SchoolAPI> {
    func fetchSchoolList() async throws -> [SchoolListEntity]
    func fetchAllSchoolName() async throws -> [String]
    func createdSchool(req: CreatedSchoolRequestDTO) async throws
    func modifySchool(schoolID: Int, req: ModifySchoolRequestDTO) async throws
    func deleteSchool(schoolID: Int) async throws
}
