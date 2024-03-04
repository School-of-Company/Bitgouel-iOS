import Foundation

public struct InputInquiryUseCaseImpl: InputInquiryUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(req: InputInquiryRequestDTO) async throws {
        try await inquiryRepository.inputInquiry(req: req)
    }
}
