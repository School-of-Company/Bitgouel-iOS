import Foundation

public struct DeleteDepartmentUseCaseImpl: DeleteDepartmentUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }

    public func callAsFunction(universityID: String, department: String) async throws {
        try await universityRepository.deleteDepartment(universityID: universityID, department: department)
    }
}
