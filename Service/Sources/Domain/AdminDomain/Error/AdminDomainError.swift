import Foundation

public enum AdminDomainError: Error {
    case badRequest
    case conflict
    case internalServerError
}

extension AdminDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "대상을 찾을 수 없습니다."

        case .conflict:
            return "이미 승인된 유저입니다."

        case .internalServerError:
            return "서버 에러가 발생했습니다. 지속될 시 문의 주세요."
        }
    }
}
