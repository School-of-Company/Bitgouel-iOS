import Foundation

public protocol CompanyRepository {
    func fetchCompanyList() async throws -> [CompanyInfoEntity]
    func createdCompany(req: CreatedCompanyRequestDTO) async throws
    func deleteCompany(companyID: String) async throws
}
