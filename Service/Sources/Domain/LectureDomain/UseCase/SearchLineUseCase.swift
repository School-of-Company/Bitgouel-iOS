import Foundation

public protocol SearchLineUseCase {
    func callAsFunction(keyword: String, division: String) async throws -> [String]
}
