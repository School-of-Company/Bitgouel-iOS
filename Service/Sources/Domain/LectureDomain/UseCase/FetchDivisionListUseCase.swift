import Foundation

public protocol FetchDivisionListUseCase {
    func callAsFunction(keyword: String, division: String) async throws -> DivisionListEntity
}
