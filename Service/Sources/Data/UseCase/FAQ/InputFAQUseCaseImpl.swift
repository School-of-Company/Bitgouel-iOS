import Foundation

public struct InputFAQUseCaseImpl: InputFAQUseCase {
    private let faqRepository: FAQRepository
    
    init(faqRepository: FAQRepository) {
        self.faqRepository = faqRepository
    }
    
    public func callAsFunction(req: InputFAQRequestDTO) async throws {
        try await faqRepository.inputFAQ(req: req)
    }
}
