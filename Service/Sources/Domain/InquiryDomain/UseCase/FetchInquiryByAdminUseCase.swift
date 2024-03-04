import Foundation

public protocol FetchInquiryByAdminUseCase {
    func callAsFunction(answerStatus: AnswerStatusType, keyword: String) async throws -> [InquiryInfoEntity]
}
