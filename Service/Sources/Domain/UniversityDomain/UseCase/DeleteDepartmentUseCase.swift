import Foundation

public protocol DeleteDepartmentUseCase {
    func callAsFunction(universityID: String, department: String) async throws
}
