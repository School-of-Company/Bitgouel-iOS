import Foundation

public protocol FetchSchoolListUseCase {
    func callAsFunction() async throws -> [SchoolListEntity]
}
