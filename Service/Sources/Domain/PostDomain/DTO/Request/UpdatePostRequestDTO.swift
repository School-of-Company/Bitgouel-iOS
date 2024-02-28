import Foundation

public struct UpdatePostRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let links: [String]

    public init(
        title: String,
        content: String,
        links: [String]
    ) {
        self.title = title
        self.content = content
        self.links = links
    }
}
