import Foundation

public struct ActivityEntity: Equatable {
    public let activityID: String
    public let title: String
    public let activityDate: String
    public let userID: String
    public let userName: String

    public init(
        activityID: String,
        title: String,
        activityDate: String,
        userID: String,
        userName: String
    ) {
        self.activityID = activityID
        self.title = title
        self.activityDate = activityDate
        self.userID = userID
        self.userName = userName
    }
}
