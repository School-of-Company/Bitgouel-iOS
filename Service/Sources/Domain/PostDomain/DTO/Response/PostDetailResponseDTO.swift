import Foundation

public struct PostDetailResponseDTO: Decodable {
    public let title: String
    public let writer: String
    public let content: String
    public let feedType: FeedType
    public let modifiedAt: String
    public let links: [String]
    
    public init(
        title: String,
        writer: String,
        content: String,
        feedType: FeedType,
        modifiedAt: String,
        links: [String]
    ) {
        self.title = title
        self.writer = writer
        self.content = content
        self.feedType = feedType
        self.modifiedAt = modifiedAt
        self.links = links
    }
}

extension PostDetailResponseDTO {
    func toDomain() {}
}
