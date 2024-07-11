import Foundation

public struct WithdrawUserInfoEntity: Equatable {
    public let withdrawID: Int
    public let userID: String
    public let name: String
    public let email: String
    public let phoneNumber: String

    public init(
        withdrawID: Int,
        userID: String,
        name: String,
        email: String,
        phoneNumber: String
    ) {
        self.withdrawID = withdrawID
        self.userID = userID
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
