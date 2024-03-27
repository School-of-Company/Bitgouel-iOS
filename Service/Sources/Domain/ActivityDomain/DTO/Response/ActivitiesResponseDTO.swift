import Foundation

public struct ActivitiesResponseDTO: Decodable {
    public let activities: Content

    public init(activities: Content) {
        self.activities = activities
    }

    public struct Content: Decodable {
        public let content: [ActivityInfoResponseDTO]

        public init(content: [ActivityInfoResponseDTO]) {
            self.content = content
        }
    }
}

public struct ActivityInfoResponseDTO: Decodable {
    public let activityID: String
    public let title: String
    public let activityDate: String
    public let userID: String
    public let username: String

    enum CodingKeys: String, CodingKey {
        case activityID = "activityId"
        case title
        case activityDate
        case userID = "userId"
        case username
    }
}

extension ActivitiesResponseDTO {
    func toDomain() -> ActivityContentEntity {
        ActivityContentEntity(
            content: activities.toDomain()
        )
    }
}

extension ActivitiesResponseDTO.Content {
    func toDomain() -> [ActivityEntity] {
        content.map { $0.toDomain() }
    }
}

extension ActivityInfoResponseDTO {
    func toDomain() -> ActivityEntity {
        ActivityEntity(
            activityID: activityID,
            title: title,
            activityDate: activityDate,
            userID: userID,
            userName: username
        )
    }
}
