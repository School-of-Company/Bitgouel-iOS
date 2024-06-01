import Foundation
import Moya

public enum FAQAPI {
    case inputFAQ(req: InputFAQRequestDTO)
    case fetchFAQList
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
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputFAQ:
            return .post

        case .fetchFAQList:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .inputFAQ(req):
            return .requestJSONEncodable(req)

        case .fetchFAQList:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .inputFAQ:
            return .accessToken

        case .fetchFAQList:
            return .none
        }
    }

    public var errorMap: [Int: FAQDomainError] {
        switch self {
        default:
            return [
                404: .notFound
            ]
        }
    }
}
