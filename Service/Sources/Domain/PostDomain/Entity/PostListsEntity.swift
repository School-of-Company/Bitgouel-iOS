import Foundation

public struct PostListsEntity: Equatable {
    public let posts: [SinglePostEntity]
    
    public init(posts: [SinglePostEntity]) {
        self.posts = posts
    }
}
