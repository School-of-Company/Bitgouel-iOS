import Foundation

public protocol SearchDivisionUseCase {
    func callAsFunction(keyword: String) async throws -> [String]
}
