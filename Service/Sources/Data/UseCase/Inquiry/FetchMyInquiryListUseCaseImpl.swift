import Foundation

public struct FetchMyInquiryListUseCaseImpl: FetchMyInquiryListUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction() async throws -> [InquiryInfoEntity] {
        try await inquiryRepository.fetchMyInquiryList()
    }
}
