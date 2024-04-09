import Foundation

public struct MyInfoEntity: Equatable {
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
}
