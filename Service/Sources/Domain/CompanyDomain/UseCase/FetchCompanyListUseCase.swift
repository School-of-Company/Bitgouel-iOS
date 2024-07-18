import Foundation

public protocol FetchCompanyListUseCase {
    func callAsFunction() async throws -> [CompanyInfoEntity]
}
