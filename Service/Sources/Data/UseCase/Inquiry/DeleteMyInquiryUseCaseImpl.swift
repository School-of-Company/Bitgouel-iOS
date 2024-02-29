import Foundation

public struct DeleteMyInquiryUseCaseImpl: DeleteMyInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(inquiryID: String) async throws {
        try await inquiryRepository.deleteMyInquiry(inquiryID: inquiryID)
    }
}
