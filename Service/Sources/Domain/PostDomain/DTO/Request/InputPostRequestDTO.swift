import Foundation

public struct InputPostRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let links: [String]
    public let feedType: FeedType

    init(
        title: String,
        content: String,
        links: [String],
        feedType: FeedType
    ) {
        self.title = title
        self.content = content
        self.links = links
        self.feedType = feedType
    }
}
