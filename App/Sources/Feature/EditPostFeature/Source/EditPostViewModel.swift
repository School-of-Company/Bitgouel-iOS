import Foundation
import Service

final class EditPostViewModel: BaseViewModel {
    @Published var postDetail: PostDetailEntity?
    @Published var modifiedTitle: String = ""
    @Published var modifiedContent: String = ""
    @Published var modifiedLinks: [String] = [""]
    @Published var postID: String = ""
    @Published var isPresentedPostDetailSettingAppend = false
    
    init(postID: String) {
        self.postID = postID
    }
    
    func updateTitle(title: String) {
        modifiedTitle = title
    }
    
    func updateContent(content: String) {
        modifiedContent = content
    }
    
    func updateLinks(links: [String]) {
        modifiedLinks = links
    }
    
    func isPresentedDetailSetting(state: Bool) {
        isPresentedPostDetailSettingAppend = state
    }
}
