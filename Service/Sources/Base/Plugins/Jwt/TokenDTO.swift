import Foundation

struct TokenDTO: Equatable, Decodable {
    let accessToken: String
    let refreshToken: String
    let accessExpiredAt: String
    let refreshExpiredAt: String
}
