import Foundation

public protocol SearchDepartmentListUseCase {
    func callAsFunction(keyword: String) async throws -> [String]
}
