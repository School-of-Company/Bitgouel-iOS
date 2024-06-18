import Foundation

public struct PostDetailEntity: Equatable {
    public let title: String
    public let writtenBy: Bool
    public let writer: String
    public let content: String
    public let feedType: FeedType
    public let modifiedAt: Date
    public let links: [String]

    public init(
        title: String,
        writtenBy: Bool,
        writer: String,
        content: String,
        feedType: FeedType,
        modifiedAt: Date,
        links: [String]
    ) {
        self.title = title
        self.writtenBy = writtenBy
        self.writer = writer
        self.content = content
        self.feedType = feedType
        self.modifiedAt = modifiedAt
        self.links = links
    }
}
