import Foundation

public protocol FAQRepository {
    func inputFAQ(req: InputFAQRequestDTO) async throws
    func fetchFAQList() async throws -> [FAQInfoEntity]
}
