import Foundation

public protocol QueryStudentActivityDetailsUseCase {
    func callAsFunction(activityID: String) async throws -> StudentActivityDetailEntity
}
