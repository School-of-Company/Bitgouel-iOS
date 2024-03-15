import Foundation

public protocol FetchInstructorListUseCase {
    func callAsFunction(keyword: String) async throws -> InstructorInfoEntity
}
