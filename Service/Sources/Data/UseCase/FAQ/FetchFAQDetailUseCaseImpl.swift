import Foundation

public struct FetchFAQDetailUseCaseImpl: FetchFAQDetailUseCase {
    private let faqRepository: FAQRepository
    
    init(faqRepository: FAQRepository) {
        self.faqRepository = faqRepository
    }
    
    public func callAsFunction(faqID: String) async throws -> FAQDetailInfoEntity {
        try await faqRepository.fetchFAQDetail(faqID: faqID)
    }
}
