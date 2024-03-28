import Foundation

public struct ActivityDetailResponseDTO: Decodable {
    public let activityID: String
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
    public let modifiedAt: String

    public init(
        activityID: String,
        title: String,
        content: String,
        credit: Int,
        activityDate: String,
        modifiedAt: String
    ) {
        self.activityID = activityID
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
        self.modifiedAt = modifiedAt
    }

    enum CodingKeys: String, CodingKey {
        case activityID = "id"
        case title
        case content
        case credit
        case activityDate
        case modifiedAt
    }
}

extension ActivityDetailResponseDTO {
    func toDomain() -> ActivityDetailEntity {
        ActivityDetailEntity(
            activityID: activityID,
            title: title,
            content: content,
            credit: credit,
            activityDate: activityDate.toDateCustomFormat(format: "yyyy-MM-dd"),
            modifiedAt: modifiedAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
        )
    }
}
