import Moya

public enum JwtTokenType: String {
    case accessToken = "Authorization"
    case refreshToken = "refresh-Token"
    case none
}

public protocol JwtAuthorizable {
    var jwtTokenType: JwtTokenType { get }
}
