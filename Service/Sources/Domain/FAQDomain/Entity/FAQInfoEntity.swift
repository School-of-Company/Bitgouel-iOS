import Foundation

public struct FAQInfoEntity: Equatable {
    public let questionID: Int
    public let question: String
    public let answer: String

    public init(
        questionID: Int,
        question: String,
        answer: String
    ) {
        self.questionID = questionID
        self.question = question
        self.answer = answer
    }
}
