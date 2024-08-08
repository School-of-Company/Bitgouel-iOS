import Foundation
import Moya

public enum SchoolAPI {
    case fetchSchoolList
    case fetchAllSchoolName
    case createdSchool(req: CreatedSchoolRequestDTO)
    case modifySchool(schoolID: Int, req: ModifySchoolRequestDTO)
    case deleteSchool(schoolID: Int)
}

extension SchoolAPI: BitgouelAPI {
    public typealias ErrorType = SchoolDomainError

    public var domain: BitgouelDomain {
        .school
    }

    public var urlPath: String {
        switch self {
        case .fetchSchoolList,
             .createdSchool:
            return ""

        case .fetchAllSchoolName:
            return "/name"

        case let .modifySchool(schoolID, _),
             let .deleteSchool(schoolID):
            return "/\(schoolID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchSchoolList,
             .fetchAllSchoolName:
            return .get

        case .createdSchool:
            return .post

        case .modifySchool:
            return .patch

        case .deleteSchool:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchSchoolList,
             .fetchAllSchoolName,
             .deleteSchool:
            return .requestPlain

        case let .createdSchool(req):
            return .requestJSONEncodable(req)

        case let .modifySchool(_, req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchSchoolList,
             .createdSchool,
             .modifySchool,
             .deleteSchool:
            return .accessToken

        case .fetchAllSchoolName:
            return .none
        }
    }

    public var errorMap: [Int: SchoolDomainError] {
        switch self {
        default:
            return [
                400: .badRequest,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
