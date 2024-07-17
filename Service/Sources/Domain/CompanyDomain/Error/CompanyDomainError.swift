import Foundation

public enum CompanyDomainError: Error {
    case notFound
    case conflict
}

extension CompanyDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFound:
            return "존재하지 않는 기업입니다."

        case .conflict:
            return "이미 존재하는 기업입니다."
        }
    }
}
