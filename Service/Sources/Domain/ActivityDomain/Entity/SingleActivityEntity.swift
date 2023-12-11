import Foundation

public struct SingleActivityEntity: Equatable {
    public let activityId: UUID
    public let title: String
    public let date: String
    public let userId: UUID
    public let name: String
    public let state: ApproveStatusType

    init(
        activityId: UUID,
        title: String,
        date: String,
        userId: UUID,
        name: String,
        state: ApproveStatusType
    ) {
        self.activityId = activityId
        self.title = title
        self.date = date
        self.userId = userId
        self.name = name
        self.state = state
    }
}
