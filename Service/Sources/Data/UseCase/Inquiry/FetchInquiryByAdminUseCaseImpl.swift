import Foundation

public struct FetchInquiryByAdminUseCaseImpl: FetchInquiryByAdminUseCase {
    private let inquiryRepository: InquiryRepository

    public init(inquiryRepository: InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }

    public func callAsFunction(answerStatus: AnswerStatusType, keyword: String) async throws -> [InquiryInfoEntity] {
        try await inquiryRepository.fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword)
    }
}
