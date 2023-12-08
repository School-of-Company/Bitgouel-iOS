import Foundation

public protocol ApproveStudentActivityUseCase {
    func callAsFunction(userID: String) async throws
}
