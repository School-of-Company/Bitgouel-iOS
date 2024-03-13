import Foundation

public protocol RemoteFAQDataSource: BaseRemoteDataSource<FAQAPI> {
    func inputFAQ(req: InputFAQRequestDTO) async throws
    func fetchFAQList() async throws -> [FAQInfoEntity]
    func fetchFAQDetail(faqID: String) async throws -> FAQDetailInfoEntity
}
