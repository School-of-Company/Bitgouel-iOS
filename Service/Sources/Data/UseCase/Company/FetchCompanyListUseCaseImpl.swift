import Foundation

public struct FetchCompanyListUseCaseImpl: FetchCompanyListUseCase {
    private let companyRepository: any CompanyRepository

    public init(companyRepository: any CompanyRepository) {
        self.companyRepository = companyRepository
    }

    public func callAsFunction() async throws -> [CompanyInfoEntity] {
        try await companyRepository.fetchCompanyList()
    }
}
