import Foundation

public protocol QueryStudentDetailByClubUseCase {
    func callAsFunction(clubId: String, studentId: String) async throws -> StudentDetailByClubEntity
}
