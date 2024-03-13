import Foundation

public struct ActivitiesEntity: Equatable {
    public let activities: ActivityContentEntity

    public init(activities: ActivityContentEntity) {
        self.activities = activities
    }
}

public struct ActivityContentEntity: Equatable {
    public let content: [ActivityEntity]

    public init(content: [ActivityEntity]) {
        self.content = content
    }
}
