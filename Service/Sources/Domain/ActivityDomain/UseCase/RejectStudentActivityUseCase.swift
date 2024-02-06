import Foundation

public protocol RejectStudentActivityUseCase {
    func callAsFunction(activityId: String) async throws
}
