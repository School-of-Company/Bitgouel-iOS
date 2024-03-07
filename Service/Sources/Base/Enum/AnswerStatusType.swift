import Foundation

public enum AnswerStatusType: String, Codable, CaseIterable {
    case answered = "ANSWERED"
    case unanswered = "UNANSWERED"
}

public extension AnswerStatusType {
    func display() -> String {
        switch self {
        case .answered: return "답변 됨"
        case .unanswered: return "답변 대기 중"
        }
    }
}
