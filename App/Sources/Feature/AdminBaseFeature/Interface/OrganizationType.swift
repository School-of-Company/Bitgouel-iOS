import Foundation

public enum OrganizationType: String {
    case company = "기업"
    case government = "유관기관"
}

extension OrganizationType {
    func display() -> String {
        switch self {
        case .company: return "기업"
        case .government: return "기관"
        }
    }
}
