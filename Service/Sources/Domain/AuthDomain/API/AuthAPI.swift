import Foundation
import Moya

public enum AuthAPI {
    case login(req: LoginRequestDTO)
    case reissueToken
    case logout(accessToken: String, refreshToken: String)
    case withdraw
    case studentSignup(req: StudentSignupRequestDTO)
    case teacherSignup(req: TeacherSignupRequestDTO)
    case bbozzakSignup(req: BbozzakSignupRequestDTO)
    case professorSignup(req: ProfessorSignupRequestDTO)
    case governmentSignup(req: GovernmentSignupRequestDTO)
    case companyInstructorSignup(req: CompanyInstructorSignupRequestDTO)
    case findPassword(req: FindPasswordRequestDTO)
}

extension AuthAPI: BitgouelAPI {
    public typealias ErrorType = AuthDomainError

    public var domain: BitgouelDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .login:
            return "/login"

        case .reissueToken, .logout:
            return ""

        case .withdraw:
            return "/withdraw"

        case .studentSignup:
            return "/student"

        case .teacherSignup:
            return "/teacher"

        case .bbozzakSignup:
            return "/bbozzak"

        case .professorSignup:
            return "/professor"

        case .governmentSignup:
            return "/government"

        case .companyInstructorSignup:
            return "/company-instructor"

        case .findPassword:
            return "/password"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .login,
             .studentSignup,
             .teacherSignup,
             .professorSignup,
             .governmentSignup,
             .companyInstructorSignup,
             .bbozzakSignup:
            return .post

        case .reissueToken,
             .findPassword:
            return .patch

        case .logout, .withdraw:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .login(req):
            return .requestJSONEncodable(req)

        case let .studentSignup(req):
            return .requestJSONEncodable(req)

        case let .teacherSignup(req):
            return .requestJSONEncodable(req)

        case let .bbozzakSignup(req):
            return .requestJSONEncodable(req)

        case let .professorSignup(req):
            return .requestJSONEncodable(req)

        case let .governmentSignup(req):
            return .requestJSONEncodable(req)

        case let .companyInstructorSignup(req):
            return .requestJSONEncodable(req)
            
        case let .findPassword(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        switch self {
        case let .logout(accessToken, refreshToken):
            return [
                "Authorization" : "Bearer \(accessToken)",
                "RefreshToken" : "Bearer \(refreshToken)",
                "Content-Type": "application/json"
            ]

        default:
            return ["Content-Type": "application/json"]
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .withdraw:
            return .accessToken

        case .reissueToken:
            return .refreshToken

        default:
            return .none
        }
    }

    public var errorMap: [Int : ErrorType] {
        switch self {
        case .studentSignup:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict,
                429: .tooManyRequest
            ]

        default :
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                407: .proxyAuthenticationRequired,
                408: .requestTimeout,
                409: .conflict,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
