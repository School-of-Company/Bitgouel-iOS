import Foundation

public protocol QueryStudentActivityDetailsUseCase {
    func callAsFunction(activityId: String) async throws -> StudentActivityDetailEntity
}
