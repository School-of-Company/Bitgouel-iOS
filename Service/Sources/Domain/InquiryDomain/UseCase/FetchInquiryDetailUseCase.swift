import Foundation

public protocol FetchInquiryDetailUseCase {
    func callAsFunction(inquiryID: String) async throws -> InquiryDetailEntity
}
