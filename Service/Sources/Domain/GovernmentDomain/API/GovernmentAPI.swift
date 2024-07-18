import Foundation
import Moya

public enum GovernmentAPI {
    case fetchGovernmentList
    case createdGovernment(req: CreatedGovernmentRequestDTO)
    case deleteGovernment(governmentID: Int)
}

extension GovernmentAPI: BitgouelAPI {
    public typealias ErrorType = GovernmentDomainError

    public var domain: BitgouelDomain {
        .government
    }

    public var urlPath: String {
        switch self {
        case .fetchGovernmentList,
             .createdGovernment:
            return ""

        case let .deleteGovernment(governmentID):
            return "/\(governmentID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchGovernmentList:
            return .get

        case .createdGovernment:
            return .post

        case .deleteGovernment:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchGovernmentList,
             .deleteGovernment:
            return .requestPlain

        case let .createdGovernment(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchGovernmentList:
            return .none

        case .createdGovernment,
             .deleteGovernment:
            return .accessToken
        }
    }

    public var errorMap: [Int: GovernmentDomainError] {
        switch self {
        case .fetchGovernmentList,
             .createdGovernment,
             .deleteGovernment:
            return [
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
