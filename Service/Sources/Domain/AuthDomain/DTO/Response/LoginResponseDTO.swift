import Foundation

public struct LoginResponseDTO: Decodable {
    public let authority: UserAuthorityType
}

extension LoginResponseDTO {
    func toDomain() -> UserLoginEntity {
        UserLoginEntity(authority: authority)
    }
}
