import Foundation
import Moya

public enum ClubAPI {
    case queryClubList(highSchool: String)
    case queryClubDetail(clubID: Int)
    case queryStudentListByClub
    case queryStudentDetailByClub(clubID: Int, studentID: String)
}

extension ClubAPI: BitgouelAPI {
    public typealias ErrorType = ClubDomainError

    public var domain: BitgouelDomain {
        .club
    }

    public var urlPath: String {
        switch self {
        case .queryClubList:
            return ""
        case let .queryClubDetail(clubID):
            return "/\(clubID)"
        case .queryStudentListByClub:
            return "/my"
        case let .queryStudentDetailByClub(clubID, studentID):
            return "/\(clubID)/\(studentID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .queryClubList,
             .queryClubDetail,
             .queryStudentListByClub,
             .queryStudentDetailByClub:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .queryClubList(highSchool):
            return .requestParameters(parameters: [
                "highSchool": highSchool
            ], encoding: URLEncoding.queryString)
        case .queryClubDetail,
             .queryStudentListByClub,
             .queryStudentDetailByClub:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .queryClubList,
             .queryClubDetail,
             .queryStudentListByClub,
             .queryStudentDetailByClub:
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
