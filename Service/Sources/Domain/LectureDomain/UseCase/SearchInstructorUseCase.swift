import Foundation

public protocol SearchInstructorUseCase {
    func callAsFunction(keyword: String) async throws -> [InstructorInfoEntity]
}
