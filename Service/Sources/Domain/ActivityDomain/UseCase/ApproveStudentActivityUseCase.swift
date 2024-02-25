import Foundation

public protocol ApproveStudentActivityUseCase {
    func callAsFunction(activityID: String) async throws
}
