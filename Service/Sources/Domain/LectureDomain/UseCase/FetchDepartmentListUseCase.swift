import Foundation

public protocol FetchDepartmentListUseCase {
    func callAsFunction(keyword: String) async throws -> [String]
}
