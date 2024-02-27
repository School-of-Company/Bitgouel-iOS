import Foundation

public protocol QueryStudentDetailByClubUseCase {
    func callAsFunction(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity
}
