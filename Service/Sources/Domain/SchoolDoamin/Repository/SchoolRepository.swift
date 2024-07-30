public protocol SchoolRepository {
    func fetchSchoolList() async throws -> [SchoolListEntity]
    func fetchAllSchoolName() async throws -> [String]
    func createdSchool(req: InputSchoolInfoRequestDTO) async throws
    func modifySchool(schoolID: Int, req: InputSchoolInfoRequestDTO) async throws
    func deleteSchool(schoolID: Int) async throws
}
