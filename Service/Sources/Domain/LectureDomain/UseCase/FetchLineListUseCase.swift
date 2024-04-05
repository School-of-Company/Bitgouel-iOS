import Foundation

public protocol FetchLineListUseCase {
    func callAsFunction(keyword: String, division: String) async throws -> [String]
}
