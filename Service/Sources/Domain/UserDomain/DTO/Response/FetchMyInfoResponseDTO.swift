import Foundation

public struct FetchMyInfoResponseDTO: Decodable {
    public let name: String
    public let email: String
    public let phoneNumber: String
    public let authority: UserAuthorityType
    public let organization: String

    public init(
        name: String,
        email: String,
        phoneNumber: String,
        authority: UserAuthorityType,
        organization: String
    ) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.authority = authority
        self.organization = organization
    }
}

extension FetchMyInfoResponseDTO {
    func toDomain() -> MyInfoEntity {
        MyInfoEntity(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            authority: authority,
            organization: organization
        )
    }
}
