import Foundation

public struct WithdrawUserInfoEntity: Equatable {
    public let withdrawID: String
    public let userID: String
    public let name: String
    
    public init(
        withdrawID: String,
        userID: String,
        name: String
    ) {
        self.withdrawID = withdrawID
        self.userID = userID
        self.name = name
    }
}
