import Foundation

public protocol DeleteInquiryByAdminUseCase {
    func callAsFunction(inquiryID: String) async throws
}
