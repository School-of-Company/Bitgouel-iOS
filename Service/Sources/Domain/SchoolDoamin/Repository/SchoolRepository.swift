public protocol SchoolRepository {
    func fetchSchoolList() async throws -> [SchoolListEntity]
    func fetchAllSchoolName() async throws -> [String]
    func createdSchool(req: CreatedSchoolRequestDTO) async throws
    func modifySchool(schoolID: String, req: ModifySchoolRequestDTO) async throws
    func deleteSchool(schoolID: String) async throws
}
