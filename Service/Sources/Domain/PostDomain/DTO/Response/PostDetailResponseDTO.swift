import Foundation

public struct PostDetailResponseDTO: Decodable {
    public let title: String
    public let writtenBy: Bool
    public let writer: String
    public let content: String
    public let feedType: FeedType
    public let modifiedAt: String
    public let links: [String]

    public init(
        title: String,
        writtenBy: Bool,
        writer: String,
        content: String,
        feedType: FeedType,
        modifiedAt: String,
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

extension PostDetailResponseDTO {
    func toDomain() -> PostDetailEntity {
        PostDetailEntity(
            title: title,
            writtenBy: writtenBy,
            writer: writer,
            content: content,
            feedType: feedType,
            modifiedAt: modifiedAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS"),
            links: links
        )
    }
}
