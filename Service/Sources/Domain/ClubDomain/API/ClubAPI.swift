import Foundation
import Moya

public enum ClubAPI {
    case queryClubList
    case queryClubDetail(id: String)
    case queryStudentListByClub
    case queryStudentDetailByClub(id: String, studentId: String)
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
        case let .queryClubDetail(id):
            return "/\(id)"
        case .queryStudentListByClub:
            return "/my"
        case .queryStudentDetailByClub(let id, let studentId):
            return "/\(id)/\(studentId)"
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
        case .queryClubList:
            return .requestParameters(parameters: [
                "highschool": HighSchoolType.self
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

    public var errorMap: [Int : ClubDomainError] {
        switch self {
        case .queryClubList,
             .queryClubDetail,
             .queryStudentListByClub,
             .queryStudentDetailByClub:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                429: .tooManyRequest
            ]
        }
    }
}
