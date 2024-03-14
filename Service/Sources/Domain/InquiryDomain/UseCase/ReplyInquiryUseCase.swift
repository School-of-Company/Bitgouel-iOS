import Foundation

public protocol ReplyInquiryUseCase {
    func callAsFunction(inquiryID: String, req: InquiryAnswerRequestDTO) async throws
}
