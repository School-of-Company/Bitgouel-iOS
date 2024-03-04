import Foundation

public protocol InputInquiryUseCase {
    func callAsFunction(req: InputInquiryRequestDTO) async throws
}
