import Foundation

public struct PostDetailEntity: Equatable {
    public let title: String
    public let writtenBy: Bool
    public let content: String
    public let feedType: FeedType
    public let modifiedAt: String
    public let links: [String]

    public init(
        title: String,
        writtenBy: Bool,
        content: String,
        feedType: FeedType,
        modifiedAt: String,
        links: [String]
    ) {
        self.title = title
        self.writtenBy = writtenBy
        self.content = content
        self.feedType = feedType
        self.modifiedAt = modifiedAt
        self.links = links
    }
}
