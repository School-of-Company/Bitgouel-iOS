import Foundation

public enum CompleteStatusType: String, Decodable {
    case notCompletedYet = "NOT_COMPLETED_YET"
    case completedIn3RD = "COMPLETED_IN_3RD"
    case completedIn2RD = "COMPLETED_IN_2RD"
    case completedIn1RD = "COMPLETED_IN_1RD"
}

extension CompleteStatusType {
    func display() -> String {
        switch self {
        case .notCompletedYet: return "아직 이수하지 않음"
        case .completedIn3RD: return "이수 완료(3학년)"
        case .completedIn2RD: return "이수 완료(2학년)"
        case .completedIn1RD: return "이수 완료(1학년)"
        }
    }
}
