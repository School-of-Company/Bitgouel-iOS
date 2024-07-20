import Foundation

public struct CreatedDepartmentUseCaseImpl: CreatedDepartmentUseCase {
    private let universityRepository: any UniversityRepository

    public init(universityRepository: any UniversityRepository) {
        self.universityRepository = universityRepository
    }

    public func callAsFunction(universityID: String, req: DepartmentRequestDTO) async throws {
        try await universityRepository.createdDepartment(universityID: universityID, req: req)
    }
}
