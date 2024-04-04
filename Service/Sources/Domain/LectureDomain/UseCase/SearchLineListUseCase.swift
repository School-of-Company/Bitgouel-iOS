import Foundation

public protocol SearchLineListUseCase {
    func callAsFunction(keyword: String, line: String) async throws -> [String]
}
