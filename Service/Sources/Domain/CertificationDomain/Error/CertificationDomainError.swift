import Foundation

public enum CertificationDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension CertificationDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."

        case .conflict:
            return "이미 취득한 자격증입니다."
        }
    }
}
