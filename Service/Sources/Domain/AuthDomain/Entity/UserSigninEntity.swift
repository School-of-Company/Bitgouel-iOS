import Foundation

public struct UserSigninEntity {
    public let userAuthority: UserAuthorityType
    
    init(userAuthority: UserAuthorityType) {
        self.userAuthority = userAuthority
    }
}
