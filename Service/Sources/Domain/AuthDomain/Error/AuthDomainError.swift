import Foundation

public enum AuthDomainError: Error {
    case badRequest
    case notFound
    case unauthorized
    case conflict
    case tooManyRequest
    case internalServerError
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "잘못된 요청입니다. 작성하지 않은 부분이 있는지 확인해주세요."
        case .notFound:
            return "대상을 찾을 수 없습니다."
        case .unauthorized:
            return "잘못된 방식입니다."
        case .conflict:
            return "중복된 요청입니다."
        case .tooManyRequest:
            return "요청이 너무 많습니다."
        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
