import Foundation

public struct SigninResponseDTO: Decodable {
    public let userAuthority: UserAuthorityType
}

extension SigninResponseDTO {
    func toDomain() -> UserSigninEntity {
        UserSigninEntity(userAuthority: userAuthority)
    }
}
