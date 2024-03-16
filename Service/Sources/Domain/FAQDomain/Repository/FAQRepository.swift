import Foundation

public protocol FAQRepository {
    func inputFAQ(req: InputFAQRequestDTO) async throws
    func fetchFAQList() async throws -> [FAQInfoEntity]
    func fetchFAQDetail(faqID: String) async throws -> FAQDetailInfoEntity
}
