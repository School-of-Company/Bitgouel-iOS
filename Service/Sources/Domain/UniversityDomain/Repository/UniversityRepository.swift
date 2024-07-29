import Foundation

public protocol UniversityRepository {
    func fetchUniversityList() async throws -> [UniversityInfoEntity]
    func createdUniversity(req: UniversityNameRequestDTO) async throws
    func modifyUniversity(universityID: Int, req: UniversityNameRequestDTO) async throws
    func deleteUniversity(universityID: Int) async throws
    func createdDepartment(universityID: Int, req: DepartmentRequestDTO) async throws
    func deleteDepartment(universityID: Int, department: String) async throws
}
