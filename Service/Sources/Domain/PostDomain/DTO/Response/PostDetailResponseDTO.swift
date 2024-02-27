import Foundation

public struct PostDetailResponseDTO: Decodable {
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

extension PostDetailResponseDTO {
    func toDomain() -> PostDetailEntity {
        PostDetailEntity(
            title: title,
            writtenBy: writtenBy,
            content: content,
            feedType: feedType,
            modifiedAt: modifiedAt,
            links: links
        )
    }
}
