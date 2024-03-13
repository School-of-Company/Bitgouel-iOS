import Foundation

public struct StudentActivityDetailEntity: Equatable {
    public let id: String
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
    public let modifiedAt: Date

    public init(
        id: String,
        title: String,
        content: String,
        credit: Int,
        activityDate: String,
        modifiedAt: Date
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
        self.modifiedAt = modifiedAt
    }
}
