import Foundation

public protocol QueryStudentActivityByIdUseCase {
    func callAsFunction(studentID: String) async throws
}
