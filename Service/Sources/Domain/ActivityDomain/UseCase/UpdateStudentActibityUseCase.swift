import Foundation

public protocol UpdateStudentActibityUseCase {
    func callAsFunction(activityId: String) async throws
}
