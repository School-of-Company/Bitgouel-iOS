import Foundation

public protocol SearchInstructorListUseCase {
    func callAsFunction(keyword: String) async throws -> [InstructorInfoEntity]
}
