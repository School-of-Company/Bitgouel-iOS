import Foundation

public struct ModifyMyInquiryUseCaseImpl: ModifyMyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await inquiryRepository.modifyMyInquiry(inquiryID: inquiryID, req: req)
    }
}
