import Foundation

public struct ActivitiesResponseDTO: Decodable {
    public let content: [ActivityInfo]

    public init(
        content: [ActivityInfo]
    ) {
        self.content = content
    }

    public struct ActivityInfo: Decodable {
        public let activityID: String
        public let title: String
        public let activityDate: String
        public let userID: String
        public let username: String
        public let approveStatus: ApproveStatusType
    }
}

extension ActivitiesResponseDTO {
    func toDomain() -> [ActivityEntity] {
        content.map { $0.toDomain() }
    }
}

extension ActivitiesResponseDTO.ActivityInfo {
    func toDomain() -> ActivityEntity {
        ActivityEntity(
            activityID: activityID,
            title: title,
            activityDate: activityDate,
            userID: userID,
            userName: username,
            approveStatus: approveStatus
        )
    }
}
