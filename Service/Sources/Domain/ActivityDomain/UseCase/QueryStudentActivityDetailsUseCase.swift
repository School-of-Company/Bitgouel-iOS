import Foundation

public protocol QueryStudentActivityDetailsUseCase {
    func callAsFunction(userID: String) async throws -> StudentActivityDetailEntity
}
