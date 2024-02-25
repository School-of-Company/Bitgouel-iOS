import Foundation

public protocol QueryStudentDetailByClubUseCase {
    func callAsFunction(clubID: String, studentID: String) async throws -> StudentDetailByClubEntity
}
