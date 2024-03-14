import Foundation

public protocol InquiryRepository {
    func inputInquiry(req: InputInquiryRequestDTO) async throws
    func fetchMyInquiryList() async throws -> [InquiryInfoEntity]
    func fetchInquiryDetail(inquiryID: String) async throws -> InquiryDetailEntity
    func deleteMyInquiry(inquiryID: String) async throws
    func modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO) async throws
    func replyInquiry(inquiryID: String, answer: String) async throws
    func fetchInquiryListByAdmin(answerStatus: String, keyword: String) async throws -> [InquiryInfoEntity]
    func deleteInquiryByAdmin(inquiryID: String) async throws
}
