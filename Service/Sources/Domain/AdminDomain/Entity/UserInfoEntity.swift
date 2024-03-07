import Foundation

public struct UserInfoEntity: Equatable {
    public let userID: String
    public let name: String
    public let autority: UserAuthorityType
    public let approveStatus: ApproveStatusType
    
    public init(
        userID: String,
        name: String,
        autority: UserAuthorityType,
        approveStatus: ApproveStatusType
    ) {
        self.userID = userID
        self.name = name
        self.autority = autority
        self.approveStatus = approveStatus
    }
}
