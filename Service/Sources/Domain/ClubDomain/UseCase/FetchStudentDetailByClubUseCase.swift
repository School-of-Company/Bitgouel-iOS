import Foundation

public protocol FetchStudentDetailByClubUseCase {
    func callAsFunction(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity
}
