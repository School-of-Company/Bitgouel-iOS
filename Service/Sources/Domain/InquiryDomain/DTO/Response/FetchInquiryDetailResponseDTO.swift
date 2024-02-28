import Foundation

public struct FetchInquiryDetailResponseDTO: Decodable {
    public let inquiryID: String
    public let question: String
    public let questionDetail: String
    public let questioner: String
    public let questionDate: String
    public let answerStatus: AnswerStatusType
    public let answer: String
    public let adminID: String
    public let answeredDate: String
    
    public init(
        inquiryID: String,
        question: String,
        questionDetail: String,
        questioner: String,
        questionDate: String,
        answerStatus: AnswerStatusType,
        answer: String,
        adminID: String,
        answeredDate: String
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
    
    enum CodingKeys: String, CodingKey {
        case inquiryID = "id"
        case question
        case questionDetail
        case questioner
        case questionDate
        case answerStatus
        case answer
        case adminID = "adminId"
        case answeredDate
    }
}

extension FetchInquiryDetailResponseDTO {
    func toDomain() -> InquiryDetailEntity {
        InquiryDetailEntity(
            inquiryID: inquiryID,
            question: question,
            questionDetail: questionDetail,
            questioner: questioner,
            questionDate: questionDate,
            answerStatus: answerStatus,
            answer: answer,
            adminID: adminID,
            answeredDate: answeredDate
        )
    }
}
