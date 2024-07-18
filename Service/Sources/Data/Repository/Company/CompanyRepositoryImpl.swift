import Foundation

public struct CompanyRepositoryImpl: CompanyRepository {
    private let remoteCompanyDataSource: any RemoteCompanyDataSource

    public init(remoteCompanyDataSource: any RemoteCompanyDataSource) {
        self.remoteCompanyDataSource = remoteCompanyDataSource
    }

    public func fetchCompanyList() async throws -> [CompanyInfoEntity] {
        try await remoteCompanyDataSource.fetchCompanyList()
    }

    public func createdCompany(req: CreatedCompanyRequestDTO) async throws {
        try await remoteCompanyDataSource.createdCompany(req: req)
    }

    public func deleteCompany(companyID: String) async throws {
        try await remoteCompanyDataSource.deleteCompany(companyID: companyID)
    }
}
