import Foundation

public protocol ReplyInquiryUseCase {
    func callAsFunction(inquiryID: String, answer: String) async throws
}
