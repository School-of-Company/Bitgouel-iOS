import Foundation

public struct StudentActivityDetailEntity: Equatable {
    public let id: UUID
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
    public let modifiedAt: String
    public let approveStatus: ApproveStatusType

    public init(
        id: UUID,
        title: String,
        content: String,
        credit: Int,
        activityDate: String,
        modifiedAt: String,
        approveState: ApproveStatusType
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
        self.modifiedAt = modifiedAt
        self.approveStatus = approveState
    }
}
