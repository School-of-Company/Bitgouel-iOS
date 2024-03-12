import Foundation

public final class RemoteInquiryDataSourceImpl: BaseRemoteDataSource<InquiryAPI>, RemoteInquiryDataSource {
    public func inputInquiry(req: InputInquiryRequestDTO) async throws {
        try await request(.inputInquiry(req: req))
    }

    public func fetchMyInquiryList() async throws -> [InquiryInfoEntity] {
        try await request(.fetchMyInquiryList, dto: FetchInquiryListResponseDTO.self).toDomain()
    }

    public func fetchInquiryDetail(inquiryID: String) async throws -> InquiryDetailEntity {
        try await request(.fetchInquiryDetail(inquiryID: inquiryID), dto: FetchInquiryDetailResponseDTO.self).toDomain()
    }

    public func deleteMyInquiry(inquiryID: String) async throws {
        try await request(.deleteMyInquiry(inquiryID: inquiryID))
    }

    public func modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await request(.modifyMyInquiry(inquiryID: inquiryID, req: req))
    }

    public func replyInquiry(inquiryID: String, answer: String) async throws {
        try await request(.replyInquiry(inquiryID: inquiryID, answer: answer))
    }

    public func fetchInquiryListByAdmin(
        answerStatus: String,
        keyword: String
    ) async throws -> [InquiryInfoEntity] {
        try await request(
            .fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword),
            dto: FetchInquiryListResponseDTO.self
        ).toDomain()
    }

    public func deleteInquiryByAdmin(inquiryID: String) async throws {
        try await request(.deleteInquiryByAdmin(inquiryID: inquiryID))
    }
}
