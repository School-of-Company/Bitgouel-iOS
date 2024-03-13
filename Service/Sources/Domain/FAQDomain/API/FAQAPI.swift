import Moya
import Foundation

public enum FAQAPI {
    case inputFAQ(req: InputFAQRequestDTO)
    case fetchFAQList
    case fetchFAQDetail(faqID: String)
}

extension FAQAPI: BitgouelAPI {
    public typealias ErrorType = FAQDomainError
    
    public var domain: BitgouelDomain {
        .faq
    }
    
    public var urlPath: String {
        switch self {
        case .inputFAQ,
             .fetchFAQList:
            return ""

        case let .fetchFAQDetail(faqID):
            return "/\(faqID)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .inputFAQ:
            return .post

        case .fetchFAQList,
             .fetchFAQDetail:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case let .inputFAQ(req):
            return .requestJSONEncodable(req)

        case .fetchFAQList,
             .fetchFAQDetail:
            return .requestPlain
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }
    
    public var errorMap: [Int : FAQDomainError] {
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
