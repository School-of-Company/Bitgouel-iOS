import Foundation

public struct DeleteCompanyUseCaseImpl: DeleteCompanyUseCase {
    private let companyRepository: any CompanyRepository

    public init(companyRepository: any CompanyRepository) {
        self.companyRepository = companyRepository
    }

    public func callAsFunction(companyID: Int) async throws {
        try await companyRepository.deleteCompany(companyID: companyID)
    }
}
