import Foundation

public struct InputActivityRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String

    public init(
        title: String,
        content: String,
        credit: Int,
        activityDate: String
    ) {
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
    }
}
