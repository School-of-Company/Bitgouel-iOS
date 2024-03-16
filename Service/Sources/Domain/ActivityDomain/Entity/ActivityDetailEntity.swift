import Foundation

public struct ActivityDetailEntity: Equatable {
    public let activityID: String
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: Date
    public let modifiedAt: Date

    public init(
        activityID: String,
        title: String,
        content: String,
        credit: Int,
        activityDate: Date,
        modifiedAt: Date
    ) {
        self.activityID = activityID
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
        self.modifiedAt = modifiedAt
    }
}
