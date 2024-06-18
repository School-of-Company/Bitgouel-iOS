import Foundation
import Moya

public enum SchoolAPI {
    case fetchSchoolList
}

extension SchoolAPI: BitgouelAPI {
    public typealias ErrorType = SchoolDomainError

    public var domain: BitgouelDomain {
        .school
    }

    public var urlPath: String {
        switch self {
        case .fetchSchoolList:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchSchoolList:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case .fetchSchoolList:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchSchoolList:
            return .accessToken
        }
    }

    public var errorMap: [Int : SchoolDomainError] {
        switch self {
        case .fetchSchoolList:
            return [
                500: .internalServerError
            ]
        }
    }
}
