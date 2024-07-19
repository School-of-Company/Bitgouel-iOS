import Foundation

public protocol CreatedDepartmentUseCase {
    func callAsFunction(universityID: String, req: DepartmentRequestDTO) async throws
}
