import Foundation

public protocol UpdateStudentActibityUseCase {
    func callAsFunction(activityID: String) async throws
}
