import Foundation

final class PostDetailViewModel: BaseViewModel {
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    @Published var postRelatedLink: [String] = []
    @Published var isPostDelete: Bool = false
    @Published var postID: String = ""
    @Published var isPresentedEditView: Bool = false
    
    init(postID: String) {
        self.postID = postID
    }
    
    func editAction() {
        isPresentedEditView = true
    }
}
