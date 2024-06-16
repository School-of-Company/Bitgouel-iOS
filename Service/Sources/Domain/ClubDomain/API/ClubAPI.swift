import Foundation
import Moya

public enum ClubAPI {
    case fetchClubList(highSchool: String)
    case fetchClubDetail(clubID: Int)
    case fetchStudentListByClub
    case fetchStudentDetailByClub(clubID: Int, studentID: String)
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
        case let .fetchClubDetail(clubID):
            return "/\(clubID)"
        case .fetchStudentListByClub:
            return "/my"
        case let .fetchStudentDetailByClub(clubID, studentID):
            return "/\(clubID)/\(studentID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchClubList,
             .fetchClubDetail,
             .fetchStudentListByClub,
             .fetchStudentDetailByClub:
            return .get
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
             .fetchStudentDetailByClub:
            return .requestPlain
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
