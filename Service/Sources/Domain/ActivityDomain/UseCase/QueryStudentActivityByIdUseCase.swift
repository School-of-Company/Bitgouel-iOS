import Foundation

public protocol QueryStudentActivityByIDUseCase {
    func callAsFunction(studentID: String) async throws -> [ActivityEntity]
}
