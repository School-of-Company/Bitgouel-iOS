import Foundation
import Moya

public enum InquiryAPI {
    case inputInquiry(req: InputInquiryRequestDTO)
    case fetchMyInquiryList
    case fetchInquiryDetail(inquiryID: String)
    case deleteMyInquiry(inquiryID: String)
    case modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO)
    case replyInquiry(inquiryID: String, req: InquiryAnswerRequestDTO)
    case fetchInquiryListByAdmin(answerStatus: String, keyword: String)
    case deleteInquiryByAdmin(inquiryID: String)
}

extension InquiryAPI: BitgouelAPI {
    public typealias ErrorType = InquiryDomainError

    public var domain: BitgouelDomain {
        .inquiry
    }

    public var urlPath: String {
        switch self {
        case .inputInquiry,
             .fetchMyInquiryList:
            return ""

        case let .fetchInquiryDetail(inquiryID),
             let .deleteMyInquiry(inquiryID),
             let .modifyMyInquiry(inquiryID, _):
            return "/\(inquiryID)"

        case let .replyInquiry(inquiryID, _):
            return "/\(inquiryID)/answer"

        case .fetchInquiryListByAdmin:
            return "/all"

        case let .deleteInquiryByAdmin(inquiryID):
            return "/\(inquiryID)/reject"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .inputInquiry,
             .replyInquiry:
            return .post

        case .fetchMyInquiryList,
             .fetchInquiryDetail,
             .fetchInquiryListByAdmin:
            return .get

        case .deleteMyInquiry,
             .deleteInquiryByAdmin:
            return .delete

        case .modifyMyInquiry:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .inputInquiry(req),
             let .modifyMyInquiry(_, req):
            return .requestJSONEncodable(req)

        case let .replyInquiry(_, req):
            return .requestJSONEncodable(req)

        case let .fetchInquiryListByAdmin(answerStatus, keyword):
            return .requestParameters(parameters: [
                "answerStatus": answerStatus,
                "keyword": keyword
            ], encoding: URLEncoding.queryString)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: InquiryDomainError] {
        switch self {
        default:
            return [
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
