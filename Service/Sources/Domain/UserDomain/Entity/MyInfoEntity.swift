import Foundation

public struct MyInfoEntity: Equatable {
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
