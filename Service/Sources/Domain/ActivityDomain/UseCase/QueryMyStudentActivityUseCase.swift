import Foundation

public protocol QueryMyStudentActivityUseCase {
    func callAsFunction() async throws -> ActivityContentEntity
}
