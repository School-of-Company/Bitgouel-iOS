import Foundation

public struct FetchInquiryDetailUseCaseImpl: FetchInquiryDetailUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(inquiryID: String) async throws -> InquiryDetailEntity {
        try await inquiryRepository.fetchInquiryDetail(inquiryID: inquiryID)
    }
}
