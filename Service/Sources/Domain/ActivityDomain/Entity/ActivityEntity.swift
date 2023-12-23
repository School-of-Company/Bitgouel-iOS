import Foundation

public struct ActivityEntity: Equatable {
    public let activityId: UUID
    public let title: String
    public let activityDate: String
    public let userId: UUID
    public let userName: String
    public let approveStatus: ApproveStatusType

    public init(
        activityId: UUID,
        title: String,
        activityDate: String,
        userId: UUID,
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
