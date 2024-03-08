import Foundation

public struct UserInfoEntity: Equatable {
    public let userID: String
    public let name: String
    public let authority: UserAuthorityType
    public let approveStatus: ApproveStatusType

    public init(
        userID: String,
        name: String,
        authority: UserAuthorityType,
        approveStatus: ApproveStatusType
    ) {
        self.userID = userID
        self.name = name
        self.authority = authority
        self.approveStatus = approveStatus
    }
}
