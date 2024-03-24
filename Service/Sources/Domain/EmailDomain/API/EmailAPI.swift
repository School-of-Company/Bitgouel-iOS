import Foundation
import Moya

public enum EmailAPI {
    case sendEmailCertificationLink(email: String)
    case fetchEmailVerificationStatus(email: String)
}

extension EmailAPI: BitgouelAPI {
    public typealias ErrorType = ActivityDomainError

    public var domain: BitgouelDomain {
        .email
    }

    public var urlPath: String {
        switch self {
        case .sendEmailCertificationLink,
             .fetchEmailVerificationStatus:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .sendEmailCertificationLink:
            return .post
        case .fetchEmailVerificationStatus:
            return .get
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .sendEmailCertificationLink(email):
            return .requestParameters(parameters: [
                "email" : email
            ], encoding: URLEncoding.httpBody)

        case let .fetchEmailVerificationStatus(email):
            return .requestParameters(parameters: [
                "email" : email
            ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    public var errorMap: [Int : ActivityDomainError] {
        switch self {
        case .sendEmailCertificationLink:
            return [
                400: .badRequest,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        case .fetchEmailVerificationStatus:
            return [
                400: .badRequest,
                401: .unauthorized
            ]
        }
    }
}
