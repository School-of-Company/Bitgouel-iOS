import Foundation

public final class RemoteCompanyDataSourceImpl: BaseRemoteDataSource<CompanyAPI>, RemoteCompanyDataSource {
    public func fetchCompanyList() async throws -> [CompanyInfoEntity] {
        try await request(.fetchCompanyList, dto: CompanyListResponseDTO.self).toDomain()
    }

    public func createdCompany(req: CreatedCompanyRequestDTO) async throws {
        try await request(.createdCompany(req: req))
    }

    public func deleteCompany(companyID: Int) async throws {
        try await request(.deleteCompany(companyID: companyID))
    }
}
