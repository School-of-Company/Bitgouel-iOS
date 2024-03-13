import Foundation

public protocol FetchActivityByIDUseCase {
    func callAsFunction(studentID: String) async throws -> ActivityContentEntity
}
