import Foundation

public protocol QueryStudentListByClubUseCase {
    func callAsFunction() async throws -> [StudentEntity]
}
