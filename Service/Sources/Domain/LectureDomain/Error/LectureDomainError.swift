import Foundation

public enum LectureDomainError: Error {
    case forbidden
    case notFound
    case conflict
}

extension LectureDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .forbidden:
            return "권한이 없습니다."

        case .notFound:
            return "대상을 찾을 수 없습니다."

        case .conflict:
            return "다시 확인해주세요."
        }
    }
}
