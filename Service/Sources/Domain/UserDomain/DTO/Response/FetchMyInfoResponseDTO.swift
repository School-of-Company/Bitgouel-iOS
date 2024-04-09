import Foundation

public struct FetchMyInfoResponseDTO: Decodable {
    public let userID: String
    public let name: String
    public let email: String
    public let phoneNumber: String
    public let authority: UserAuthorityType
    public let organization: String

    public init(
        userID: String,
        name: String,
        email: String,
        phoneNumber: String,
        authority: UserAuthorityType,
        organization: String
    ) {
        self.userID = userID
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.authority = authority
        self.organization = organization
    }

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case email
        case phoneNumber
        case authority
        case organization
    }
}

extension FetchMyInfoResponseDTO {
    func toDomain() -> MyInfoEntity {
        MyInfoEntity(
            userID: userID,
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            authority: authority,
            organization: organization
        )
    }
}
