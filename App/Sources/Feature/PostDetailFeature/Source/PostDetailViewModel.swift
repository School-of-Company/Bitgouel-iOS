import Foundation

final class PostDetailViewModel: BaseViewModel {
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    @Published var postRelatedLink: [String] = []
    @Published var isPostDelete: Bool = false
}
