import Foundation
import Service

final class EditPostViewModel: BaseViewModel {
    @Published var postDetail: PostDetailEntity?
    @Published var modifiedTitle: String = ""
    @Published var modifiedContent: String = ""
    @Published var modifiedLinks: [String] = [""]
    @Published var postID: String = ""
    
    init(postID: String) {
        self.postID = postID
    }
    
    func updateTitle(title: String) {
        modifiedTitle = title
        print(modifiedTitle)
    }
    
    func updateContent(content: String) {
        modifiedContent = content
        print(modifiedContent)
    }
    
    func updateLinks(links: [String]) {
        modifiedLinks = links
    }
}
