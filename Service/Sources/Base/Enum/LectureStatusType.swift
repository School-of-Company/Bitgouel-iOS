import Foundation

public enum LectureStatusType: String, Decodable {
    case open = "OPENED"
    case close = "CLOSED"
}

extension LectureStatusType {
    func display() -> String {
        switch self {
        case .open: return "수강신청 열림"
        case .close: return "수강신청 닫힘"
        }
    }
}
