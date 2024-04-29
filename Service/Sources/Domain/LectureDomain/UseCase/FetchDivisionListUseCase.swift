import Foundation

public protocol FetchDivisionListUseCase {
    func callAsFunction(keyword: String) async throws -> [String]
}
