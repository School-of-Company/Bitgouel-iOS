import Foundation

public protocol QueryStudentListByClubUseCase {
    func callAsFunction(id: String) async throws -> StudentsEntity
}
