import Foundation

public protocol ModifyMyInquiryUseCase {
    func callAsFunction(inquiryID: String, req: InputInquiryRequestDTO) async throws
}
