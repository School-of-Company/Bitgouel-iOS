import Foundation

public protocol FetchInquiryByAdminUseCase {
    func callAsFunction(answerStatus: String, keyword: String) async throws -> [InquiryInfoEntity]
}
