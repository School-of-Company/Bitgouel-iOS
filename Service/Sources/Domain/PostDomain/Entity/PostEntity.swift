import Foundation

public struct PostEntity: Equatable {
    public let postId: String
    public let title: String
    public let modifedAt: String
    
    public init(
        postId: String,
        title: String,
        modifedAt: String
    ) {
        self.postId = postId
        self.title = title
        self.modifedAt = modifedAt
    }
}
