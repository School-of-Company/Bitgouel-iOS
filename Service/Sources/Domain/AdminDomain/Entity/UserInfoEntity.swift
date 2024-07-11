import Foundation

public struct UserInfoEntity: Equatable {
    public let userID: String
    public let name: String
    public let authority: UserAuthorityType
    public let approveStatus: ApproveStatusType
    public let phoneNumber: String
    public let subscriptionYear: Int
    public let subscriptionGrade: Int?
    public let email: String

    public init(
        userID: String,
        name: String,
        authority: UserAuthorityType,
        approveStatus: ApproveStatusType,
        phoneNumber: String,
        subscriptionYear: Int,
        subscriptionGrade: Int?,
        email: String
    ) {
        self.userID = userID
        self.name = name
        self.authority = authority
        self.approveStatus = approveStatus
        self.phoneNumber = phoneNumber
        self.subscriptionYear = subscriptionYear
        self.subscriptionGrade = subscriptionGrade
        self.email = email
    }
}
