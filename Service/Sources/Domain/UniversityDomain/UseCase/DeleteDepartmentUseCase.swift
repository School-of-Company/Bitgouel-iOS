import Foundation

public protocol DeleteDepartmentUseCase {
    func callAsFunction(universityID: Int, department: String) async throws
}
