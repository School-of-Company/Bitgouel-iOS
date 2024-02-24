import Foundation

public protocol RejectStudentActivityUseCase {
    func callAsFunction(activityID: String) async throws
}
