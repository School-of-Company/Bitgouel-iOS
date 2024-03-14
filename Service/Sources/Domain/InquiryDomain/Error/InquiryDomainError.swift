import Foundation

public enum InquiryDomainError: Error {
    case forbidden
    case conflict
    case invalidRequest
}

//extension InquiryDomainError: LocalizedError {
//    public var errorDescription: String? {
//        switch self {
//        case .forbidden:
//            return "권한이 없습니다."
//        case .conflict:
//            return "같은 문의사항이 존재합니다."
//        case .invalidRequest:
//            return "알 수 없는 에러가 발생하였습니다."
//        }
//    }
//}
