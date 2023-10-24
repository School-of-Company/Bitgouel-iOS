import Foundation

struct TokenDTO: Equatable, Decodable {
    let accessToken: String
    let refreshToken: String
    let accessExpiredAt: String
    let refreshExpiredAt: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
        case accessExpiredAt = "accessExpiredAt"
        case refreshExpiredAt = "refreshExpiredAt"
    }
}
