import Foundation

public protocol DeleteMyInquiryUseCase {
    func callAsFunction(inquiryID: String) async throws
}
