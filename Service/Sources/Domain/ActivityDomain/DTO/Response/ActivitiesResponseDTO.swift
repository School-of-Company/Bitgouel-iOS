import Foundation

public struct ActivitiesResponseDTO: Decodable {
    public let content: [ActivityInfo]

    public init(
        content: [ActivityInfo]
    ) {
        self.content = content
    }

    public struct ActivityInfo: Decodable {
        public let activityId: String
        public let title: String
        public let activityDate: String
        public let userId: String
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
            activityId: activityId,
            title: title,
            activityDate: activityDate,
            userId: userId,
            userName: username,
            approveStatus: approveStatus
        )
    }
}
