import Foundation

public protocol DeleteStudentActivityUseCase {
    func callAsFunction(activityId: String) async throws
}
