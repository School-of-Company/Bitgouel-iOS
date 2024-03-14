import Foundation

public protocol FetchFAQDetailUseCase {
    func callAsFunction(faqID: String) async throws -> FAQDetailInfoEntity
}
