import Foundation

public protocol RemoteSchoolDataSource: BaseRemoteDataSource<SchoolAPI> {
    func fetchSchoolList() async throws -> [SchoolListEntity]
    func fetchAllSchoolName() async throws -> [String]
    func createdSchool(logoImage: Data, req: InputSchoolInfoRequestDTO) async throws
    func modifySchool(schoolID: Int, logoImage: Data, req: InputSchoolInfoRequestDTO) async throws
    func deleteSchool(schoolID: Int) async throws
}
