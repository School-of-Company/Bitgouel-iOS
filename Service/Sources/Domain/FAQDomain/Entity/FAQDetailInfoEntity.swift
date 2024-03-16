import Foundation

public struct FAQDetailInfoEntity: Equatable {
    public let questionID: String
    public let question: String
    public let answer: String

    public init(
        questionID: String,
        question: String,
        answer: String
    ) {
        self.questionID = questionID
        self.question = question
        self.answer = answer
    }
}
