import Foundation
import Moya

public enum ClubAPI {
    case fetchClubList(highSchool: String)
    case fetchClubDetail(clubID: Int)
    case fetchStudentListByClub
    case fetchStudentDetailByClub(clubID: Int, studentID: String)
    case createdClub(schoolID: Int, req: InputClubRequestDTO)
    case modifyClub(clubID: Int, req: InputClubRequestDTO)
    case deleteClub(clubID: Int)
}

extension ClubAPI: BitgouelAPI {
    public typealias ErrorType = ClubDomainError

    public var domain: BitgouelDomain {
        .club
    }

    public var urlPath: String {
        switch self {
        case .fetchClubList:
            return ""

        case let .fetchClubDetail(clubID),
             let .modifyClub(clubID, _),
             let .deleteClub(clubID):
            return "/\(clubID)"

        case .fetchStudentListByClub:
            return "/my"

        case let .fetchStudentDetailByClub(clubID, studentID):
            return "/\(clubID)/\(studentID)"

        case let .createdClub(schoolID, _):
            return "/\(schoolID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchClubList,
             .fetchClubDetail,
             .fetchStudentListByClub,
             .fetchStudentDetailByClub:
            return .get

        case .createdClub:
            return .post

        case .modifyClub:
            return .patch

        case .deleteClub:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchClubList(highSchool):
            return .requestParameters(parameters: [
                "highSchool": highSchool
            ], encoding: URLEncoding.queryString)

        case .fetchClubDetail,
             .fetchStudentListByClub,
             .fetchStudentDetailByClub,
             .deleteClub:
            return .requestPlain

        case let .createdClub(_, req):
            return .requestJSONEncodable(req)

        case let .modifyClub(_, req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    public var errorMap: [Int: ClubDomainError] {
        switch self {
        default:
            return [
                401: .unauthorized,
                404: .notFound
            ]
        }
    }
}
