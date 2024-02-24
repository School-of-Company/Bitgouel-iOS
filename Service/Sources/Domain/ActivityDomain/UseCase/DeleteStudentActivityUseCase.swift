import Foundation

public protocol DeleteStudentActivityUseCase {
    func callAsFunction(activityID: String) async throws
}
