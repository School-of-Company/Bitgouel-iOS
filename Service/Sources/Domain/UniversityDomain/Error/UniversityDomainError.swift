import Foundation

public enum UniversityDomainError: Error {
    case notFound
    case conflict
}

extension UniversityDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound: return "존재하지 않는 대학입니다."
        case .conflict: return "아직 존재하는 대학입니다."
        }
    }
}
