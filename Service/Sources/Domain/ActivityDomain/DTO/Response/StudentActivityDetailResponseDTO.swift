import Foundation

public struct StudentActivityDetailResponseDTO: Decodable {
    public let id: String
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
    public let modifiedAt: String

    public init(
        id: String,
        title: String,
        content: String,
        credit: Int,
        activityDate: String,
        modifiedAt: String
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.credit = credit
        self.activityDate = activityDate
        self.modifiedAt = modifiedAt
    }
}

extension StudentActivityDetailResponseDTO {
    func toDomain() -> StudentActivityDetailEntity {
        StudentActivityDetailEntity(
            id: id,
            title: title,
            content: content,
            credit: credit,
            activityDate: activityDate,
            modifiedAt: modifiedAt.toDateCustomFormat(format: "yyyy.M.dd")
        )
    }
}
