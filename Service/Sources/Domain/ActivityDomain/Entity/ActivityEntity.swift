import Foundation

public struct ActivityEntity: Equatable {
    public let activityId: String
    public let title: String
    public let activityDate: String
    public let userId: String
    public let userName: String
    public let approveStatus: ApproveStatusType

    public init(
        activityId: String,
        title: String,
        activityDate: String,
        userId: String,
        userName: String,
        approveStatus: ApproveStatusType
    ) {
        self.activityId = activityId
        self.title = title
        self.activityDate = activityDate
        self.userId = userId
        self.userName = userName
        self.approveStatus = approveStatus
    }
}
