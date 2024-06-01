import Foundation

public enum ClubDomainError: Error {
    case unauthorized
    case notFound
}

extension ClubDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "유효하지 않은 권한입니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."
        }
    }
}
