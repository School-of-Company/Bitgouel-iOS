import Foundation

public protocol DeleteMyInquiry {
    func callAsFunction(inquiryID: String) async throws
}
