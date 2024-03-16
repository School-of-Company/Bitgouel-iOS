import Foundation

public protocol SearchDivisionListUseCase {
    func callAsFunction(keyword: String, division: String) async throws -> DivisionListEntity
}
