import Foundation

public struct InquiryInfoEntity: Equatable {
    public let inquiryID: String
    public let question: String
    public let userID: String
    public let username: String
    public let createdAt: String
    public let answerStatus: AnswerStatusType

    public init(
        inquiryID: String,
        question: String,
        userID: String,
        username: String,
        createdAt: String,
        answerStatus: AnswerStatusType
    ) {
        self.inquiryID = inquiryID
        self.question = question
        self.userID = userID
        self.username = username
        self.createdAt = createdAt
        self.answerStatus = answerStatus
    }
}
