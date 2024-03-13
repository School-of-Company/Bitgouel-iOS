import Foundation

public final class RemoteFAQDataSourceImpl: BaseRemoteDataSource<FAQAPI>, RemoteFAQDataSource {
    public func inputFAQ(req: InputFAQRequestDTO) async throws {
        try await request(.inputFAQ(req: req))
    }

    public func fetchFAQList() async throws -> [FAQInfoEntity] {
        try await request(.fetchFAQList, dto: FetchFAQListResponseDTO.self).toDomain()
    }

    public func fetchFAQDetail(faqID: String) async throws -> FAQDetailInfoEntity {
        try await request(.fetchFAQDetail(faqID: faqID), dto: FetchFAQDetailResponseDTO.self).toDomain()
    }
}
