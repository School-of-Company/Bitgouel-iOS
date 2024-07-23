import Foundation
import Moya

public enum CompanyAPI {
    case fetchCompanyList
    case createdCompany(req: CreatedCompanyRequestDTO)
    case deleteCompany(companyID: Int)
}

extension CompanyAPI: BitgouelAPI {
    public typealias ErrorType = CompanyDomainError

    public var domain: BitgouelDomain {
        .company
    }

    public var urlPath: String {
        switch self {
        case .fetchCompanyList,
             .createdCompany:
            return ""

        case let .deleteCompany(companyID):
            return "/\(companyID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchCompanyList:
            return .get

        case .createdCompany:
            return .post

        case .deleteCompany:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchCompanyList,
             .deleteCompany:
            return .requestPlain

        case let .createdCompany(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchCompanyList:
            return .none

        case .createdCompany,
             .deleteCompany:
            return .accessToken
        }
    }

    public var errorMap: [Int: CompanyDomainError] {
        switch self {
        case .fetchCompanyList,
             .createdCompany,
             .deleteCompany:
            return [
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
