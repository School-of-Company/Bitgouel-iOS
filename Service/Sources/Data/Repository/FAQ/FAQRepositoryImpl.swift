import Foundation

public struct FAQRepositoryImpl: FAQRepository {
    private let remoteFAQDataSource: RemoteFAQDataSource

    public init(remoteFAQDataSource: RemoteFAQDataSource) {
        self.remoteFAQDataSource = remoteFAQDataSource
    }
    
    public func inputFAQ(req: InputFAQRequestDTO) async throws {
        try await remoteFAQDataSource.inputFAQ(req: req)
    }
    
    public func fetchFAQList() async throws -> [FAQInfoEntity] {
        try await remoteFAQDataSource.fetchFAQList()
    }
    
    public func fetchFAQDetail(faqID: String) async throws -> FAQDetailInfoEntity {
        try await remoteFAQDataSource.fetchFAQDetail(faqID: faqID)
    }
}
