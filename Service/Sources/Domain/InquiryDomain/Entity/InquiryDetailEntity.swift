import Foundation

public struct InquiryDetailEntity: Equatable {
    public let inquiryID: String
    public let question: String
    public let questionDetail: String
    public let questioner: String
    public let questionDate: Date
    public let answerStatus: AnswerStatusType
    public let answer: String?
    public let adminID: String?
    public let answeredDate: Date?

    public init(
        inquiryID: String,
        question: String,
        questionDetail: String,
        questioner: String,
        questionDate: Date,
        answerStatus: AnswerStatusType,
        answer: String?,
        adminID: String?,
        answeredDate: Date?
    ) {
        self.inquiryID = inquiryID
        self.question = question
        self.questionDetail = questionDetail
        self.questioner = questioner
        self.questionDate = questionDate
        self.answerStatus = answerStatus
        self.answer = answer
        self.adminID = adminID
        self.answeredDate = answeredDate
    }
}
