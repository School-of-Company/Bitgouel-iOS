import Foundation

public enum LectureDomainError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case conflict
}

extension LectureDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "잘못된 요청입니다."

        case .unauthorized:
            return "인증을 실패했습니다."

        case .forbidden:
            return "권한이 없습니다."

        case .conflict:
            return "신청기간이 유효하지 않습니다."
        }
    }
}
