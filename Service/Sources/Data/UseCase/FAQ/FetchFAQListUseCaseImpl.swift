import Foundation

public struct FetchFAQListUseCaseImpl: FetchFAQListUseCase {
    private let faqRepository: FAQRepository

    public init(faqRepository: FAQRepository) {
        self.faqRepository = faqRepository
    }

    public func callAsFunction() async throws -> [FAQInfoEntity] {
        try await faqRepository.fetchFAQList()
    }
}
