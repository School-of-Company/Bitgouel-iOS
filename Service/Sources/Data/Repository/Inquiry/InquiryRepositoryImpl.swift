import Foundation

public struct InquiryRepositoryImpl: InquiryRepository {
    private let remoteInquiryDataSource: RemoteInquiryDataSource

    public init(remoteInquiryDataSource: RemoteInquiryDataSource) {
        self.remoteInquiryDataSource = remoteInquiryDataSource
    }

    public func inputInquiry(req: InputInquiryRequestDTO) async throws {
        try await remoteInquiryDataSource.inputInquiry(req: req)
    }

    public func fetchMyInquiryList() async throws -> [InquiryInfoEntity] {
        try await remoteInquiryDataSource.fetchMyInquiryList()
    }

    public func fetchInquiryDetail(inquiryID: String) async throws -> InquiryDetailEntity {
        try await remoteInquiryDataSource.fetchInquiryDetail(inquiryID: inquiryID)
    }

    public func deleteMyInquiry(inquiryID: String) async throws {
        try await remoteInquiryDataSource.deleteMyInquiry(inquiryID: inquiryID)
    }

    public func modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await remoteInquiryDataSource.modifyMyInquiry(inquiryID: inquiryID, req: req)
    }

    public func replyInquiry(inquiryID: String, answer: String) async throws {
        try await remoteInquiryDataSource.replyInquiry(inquiryID: inquiryID, answer: answer)
    }

    public func fetchInquiryListByAdmin(
        answerStatus: String,
        keyword: String
    ) async throws -> [InquiryInfoEntity] {
        try await remoteInquiryDataSource.fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword)
    }

    public func deleteInquiryByAdmin(inquiryID: String) async throws {
        try await remoteInquiryDataSource.deleteInquiryByAdmin(inquiryID: inquiryID)
    }
}
