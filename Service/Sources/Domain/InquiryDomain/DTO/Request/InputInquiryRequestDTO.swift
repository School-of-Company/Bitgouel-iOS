import Foundation

public struct InputInquiryRequestDTO: Encodable {
    public let question: String
    public let questionDetail: String

    public init(
        question: String,
        questionDetail: String
    ) {
        self.question = question
        self.questionDetail = questionDetail
    }
}
