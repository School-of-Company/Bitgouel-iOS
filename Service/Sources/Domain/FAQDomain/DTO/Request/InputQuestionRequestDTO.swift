import Foundation

public struct InputQuestionRequestDTO: Encodable {
    public let question: String
    public let answer: String
    
    public init(
        question: String,
        answer: String
    ) {
        self.question = question
        self.answer = answer
    }
}
