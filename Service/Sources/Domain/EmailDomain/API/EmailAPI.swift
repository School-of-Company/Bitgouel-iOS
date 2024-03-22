import Moya
import Foundation

public enum EmailAPI {
    case sendEmailCertificationLink(email: String)
    case fetchEmailVerificationStatus(email: String)
}

extension EmailAPI: BitgouelAPI {
    typealias ErrorType = ActivityDomainError
    
    var domain: BitgouelDomain {
        .email
    }

    var urlPath: String {
        switch self {
        case .sendEmailCertificationLink,
             .fetchEmailVerificationStatus:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .sendEmailCertificationLink:
            return .post
        case .fetchEmailVerificationStatus:
            return .get
        }
    }
    
    var task: Moya.Task {
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
    
    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    var errorMap: [Int : ActivityDomainError] {
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
