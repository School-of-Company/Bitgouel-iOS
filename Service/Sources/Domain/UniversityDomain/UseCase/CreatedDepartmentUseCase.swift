import Foundation

public protocol CreatedDepartmentUseCase {
    func callAsFunction(universityID: Int, req: DepartmentRequestDTO) async throws
}
