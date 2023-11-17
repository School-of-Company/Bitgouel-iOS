import Foundation

public enum AssociationType: String, CaseIterable, Decodable, Encodable {
    case school = "SCHOOL"
    case external = "EXTERNAL"
}

public extension AssociationType {
    func associationValue() -> String {
        switch self {
        case .school: return "학교"
        case .external: return "외부"
        }
    }
}
