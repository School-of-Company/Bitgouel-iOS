import Foundation
import Moya

public enum AuthAPI {
    case login(LoginRequestDTO)
    case reissueToken
    case logout
    case withdraw
    case studentSignup(StudentSignupRequestDTO)
    case teacherSignup(TeacherSignupRequestDTO)
    case professorSignup(ProfessorSignupRequestDTO)
    case governmentSignup(GrovernmentSignupRequestDTO)
    case companyInstructorSignup(CompanyInstructorSignupRequestDTO)
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

        case .professorSignup:
            return "/professor"

        case .governmentSignup:
            return "/government"

        case .companyInstructorSignup:
            return "/company-instructor"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .login, .studentSignup, .teacherSignup, .professorSignup, .governmentSignup, .companyInstructorSignup:
            return .post

        case .reissueToken:
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

        case let .professorSignup(req):
            return .requestJSONEncodable(req)

        case let .governmentSignup(req):
            return .requestJSONEncodable(req)

        case let .companyInstructorSignup(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken, .logout:
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
