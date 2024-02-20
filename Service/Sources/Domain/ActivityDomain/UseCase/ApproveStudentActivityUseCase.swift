import Foundation

public protocol ApproveStudentActivityUseCase {
    func callAsFunction(activityId: String) async throws
}
