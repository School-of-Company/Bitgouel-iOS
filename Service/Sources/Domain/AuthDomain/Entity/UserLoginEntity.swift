import Foundation

public struct UserLoginEntity {
    public let authority: UserAuthorityType

    public init(authority: UserAuthorityType) {
        self.authority = authority
    }
}
