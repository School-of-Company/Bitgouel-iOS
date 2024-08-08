import Foundation

public protocol SearchDepartmentUseCase {
    func callAsFunction(keyword: String) async throws -> [String]
}
