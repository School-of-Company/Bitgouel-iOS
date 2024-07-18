import Foundation

public struct CreatedCompanyUseCaseImpl: CreatedCompanyUseCase {
    private let companyRepository: any CompanyRepository

    public init(companyRepository: any CompanyRepository) {
        self.companyRepository = companyRepository
    }

    public func callAsFunction(req: CreatedCompanyRequestDTO) async throws {
        try await companyRepository.createdCompany(req: req)
    }
}
