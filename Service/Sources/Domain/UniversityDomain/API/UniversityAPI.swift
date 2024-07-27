import Foundation
import Moya

public enum UniversityAPI {
    case fetchUniversityList
    case createdUniversity(req: UniversityNameRequestDTO)
    case modifyUniversity(universityID: Int, req: UniversityNameRequestDTO)
    case deleteUniversity(universityID: Int)
    case createdDepartment(universityID: Int, req: DepartmentRequestDTO)
    case deleteDepartment(universityID: Int, department: String)
}

extension UniversityAPI: BitgouelAPI {
    public typealias ErrorType = UniversityDomainError

    public var domain: BitgouelDomain {
        .university
    }

    public var urlPath: String {
        switch self {
        case .fetchUniversityList,
             .createdUniversity:
            return ""

        case let .modifyUniversity(universityID, _),
             let .deleteUniversity(universityID):
            return "/\(universityID)"

        case let .createdDepartment(universityID, _),
             let .deleteDepartment(universityID, _):
            return "/department/\(universityID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchUniversityList:
            return .get

        case .createdUniversity,
             .createdDepartment:
            return .post

        case .deleteUniversity,
             .deleteDepartment:
            return .delete

        case .modifyUniversity:
            return .patch
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchUniversityList,
             .deleteUniversity:
            return .requestPlain

        case let .createdUniversity(req),
             let .modifyUniversity(_, req):
            return .requestJSONEncodable(req)

        case let .createdDepartment(_, req):
            return .requestJSONEncodable(req)

        case let .deleteDepartment(_, department):
            return .requestParameters(
                parameters: [
                    "department": department
                ],
                encoding: URLEncoding.queryString
            )
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchUniversityList:
            return .none

        case .createdUniversity,
             .modifyUniversity,
             .deleteUniversity,
             .createdDepartment,
             .deleteDepartment:
            return .accessToken
        }
    }

    public var errorMap: [Int: UniversityDomainError] {
        switch self {
        default:
            return [
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
