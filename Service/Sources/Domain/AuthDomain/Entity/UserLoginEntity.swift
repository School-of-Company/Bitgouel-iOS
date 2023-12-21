import Foundation

public struct UserLoginEntity {
    public let authority: UserAuthorityType

    init(authority: UserAuthorityType) {
        self.authority = authority
    }
}
