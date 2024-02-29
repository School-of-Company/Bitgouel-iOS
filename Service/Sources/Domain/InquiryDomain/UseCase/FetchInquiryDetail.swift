import Foundation

public protocol FetchInquiryDetail {
    func callAsFunction(inquiryID: String) async throws -> InquiryDetailEntity
}
