import Foundation

public protocol RemoteCompanyDataSource: BaseRemoteDataSource<CompanyAPI> {
    func fetchCompanyList() async throws -> [CompanyInfoEntity]
    func createdCompany(req: CreatedCompanyRequestDTO) async throws
    func deleteCompany(companyID: Int) async throws
}
