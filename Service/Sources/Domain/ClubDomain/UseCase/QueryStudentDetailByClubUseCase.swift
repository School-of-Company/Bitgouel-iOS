import Foundation

public protocol QueryStudentDetailByClubUseCase {
    func callAsFunction(id: String, studentId: String) async throws -> StudentDetailByClubEntity
}
