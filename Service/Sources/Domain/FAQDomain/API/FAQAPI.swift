import Moya
import Foundation

enum FAQAPI {
    case inputFAQ(req: InputFAQRequestDTO)
    case fetchFAQList
    case fetchFAQDetail(faqID: String)
}

extension FAQAPI: BitgouelAPI {
    typealias ErrorType = FAQDomainError
    
    var domain: BitgouelDomain {
        .faq
    }
    
    var urlPath: String {
        switch self {
        case .inputFAQ,
             .fetchFAQList:
            return ""

        case let .fetchFAQDetail(faqID):
            return "/\(faqID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .inputFAQ:
            return .post

        case .fetchFAQList,
             .fetchFAQDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .inputFAQ(req):
            return .requestJSONEncodable(req)

        case .fetchFAQList,
             .fetchFAQDetail:
            return .requestPlain
        }
    }
    
    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }
    
    var errorMap: [Int : FAQDomainError] {
        switch self {
        case .inputFAQ:
            return [
                400: .internalServerError,
                401: .internalServerError,
                403: .forbidden,
                409: .conflict,
                429: .internalServerError
            ]
            
        case .fetchFAQList:
            return [
                400: .internalServerError,
                401: .internalServerError,
                429: .internalServerError
            ]
            
        case .fetchFAQDetail:
            return [
                400: .internalServerError,
                401: .internalServerError,
                404: .internalServerError,
                429: .internalServerError
            ]
        }
    }
}
