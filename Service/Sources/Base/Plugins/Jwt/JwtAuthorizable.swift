import Moya

public enum JwtTokenType: String {
    case accessToken = "Authorization"
    case refreshToken = "RefreshToken"
    case none
}

public protocol JwtAuthorizable {
    var jwtTokenType: JwtTokenType { get }
}
