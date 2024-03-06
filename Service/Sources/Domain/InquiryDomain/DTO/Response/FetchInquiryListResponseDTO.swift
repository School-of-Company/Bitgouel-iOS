import Foundation

public struct FetchInquiryListResponseDTO: Decodable {
    public let inquiries: [InquiryInfo]

    init(inquiries: [InquiryInfo]) {
        self.inquiries = inquiries
    }

    public struct InquiryInfo: Decodable {
        public let inquiryID: String
        public let question: String
        public let userID: String
        public let username: String
        public let answerStatus: AnswerStatusType
        public let createdAt: String

        public init(
            inquiryID: String,
            question: String,
            userID: String,
            username: String,
            answerStatus: AnswerStatusType,
            createdAt: String
        ) {
            self.inquiryID = inquiryID
            self.question = question
            self.userID = userID
            self.username = username
            self.answerStatus = answerStatus
            self.createdAt = createdAt
        }

        enum CodingKeys: String, CodingKey {
            case inquiryID = "id"
            case question
            case userID = "userId"
            case username
            case answerStatus
            case createdAt
        }
    }
}

extension FetchInquiryListResponseDTO {
    func toDomain() -> [InquiryInfoEntity] {
        inquiries.map { $0.toDomain() }
    }
}

extension FetchInquiryListResponseDTO.InquiryInfo {
    func toDomain() -> InquiryInfoEntity {
        InquiryInfoEntity(
            inquiryID: inquiryID,
            question: question,
            userID: userID,
            username: username,
            answerStatus: answerStatus
        )
    }
}
