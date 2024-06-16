public protocol SchoolRepository {
    func fetchSchoolList() async throws -> [SchoolListEntity]
}
