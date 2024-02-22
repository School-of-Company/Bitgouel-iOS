import Foundation

public struct PostEntity: Equatable {
    public let postID: String
    public let title: String
    public let modifiedAt: String

    public init(
        postID: String,
        title: String,
        modifiedAt: String
    ) {
        self.postID = postID
        self.title = title
        self.modifiedAt = modifiedAt
    }
}

public struct PostContentEntity: Equatable {
    public let content: [PostEntity]

    public init(content: [PostEntity]) {
        self.content = content
    }
}
