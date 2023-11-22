import Foundation

public enum ApproveStatusType: String, CaseIterable, Codable {
    case pending = "PENDING"
    case approve = "APPROVED"
}

public extension ApproveStatusType {
    func display() -> String {
        switch self {
        case .pending: return "승인 대기 중"
        case .approve: return "승인됨"
        }
    }
}
