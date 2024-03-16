import Foundation

public struct ReplyInquiryUseCaseImpl: ReplyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(inquiryID: String, req: InquiryAnswerRequestDTO) async throws {
        try await inquiryRepository.replyInquiry(inquiryID: inquiryID, req: req)
    }
}
