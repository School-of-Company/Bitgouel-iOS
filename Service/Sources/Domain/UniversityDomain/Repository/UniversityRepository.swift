import Foundation

public protocol UniversityRepository {
    func fetchUniversityList() async throws -> [UniversityInfoEntity]
    func createdUniversity(req: UniversityNameRequestDTO) async throws
    func modifyUniversity(universityID: String, req: UniversityNameRequestDTO) async throws
    func deleteUniversity(universityID: String) async throws
    func createdDepartment(universityID: String, req: DepartmentRequestDTO) async throws
    func deleteDepartment(universityID: String, department: String) async throws
}
