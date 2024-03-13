import Foundation

public struct ActivitiesResponseDTO: Decodable {
    public let activities: Content
    
    public init(activities: Content) {
        self.activities = activities
    }
    
    public struct Content: Decodable {
        public let content: [ActivityInfo]

        public init(content: [ActivityInfo]) {
            self.content = content
        }
    }

    public struct ActivityInfo: Decodable {
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

extension ActivitiesResponseDTO.ActivityInfo {
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
