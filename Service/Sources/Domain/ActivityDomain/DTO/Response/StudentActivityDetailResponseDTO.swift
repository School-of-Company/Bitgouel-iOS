import Foundation

public struct StudentActivityDetailResponseDTO: Decodable {
    public let id: String
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
    public let modifiedAt: String
    public let approveState: ApproveStatusType

    public init(
        id: String,
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
        self.approveState = approveState
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
            modifiedAt: modifiedAt, 
            approveState: approveState
        )
    }
}
