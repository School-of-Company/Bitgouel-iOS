import Foundation
import Service

final class PostListViewModel: BaseViewModel {
    @MainActor
    var postContent: PostContentEntity? {
        get {
            _postContent.map {
                PostContentEntity(content: $0.content)
            }
        } set { _postContent = newValue }
    }

    @Published var _postContent: PostContentEntity?
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedNoticeListView: Bool = false
    @Published var isPresentedInquiryView: Bool = false
    @Published var isPresentedInputPostView: Bool = false
    @Published var isPresentedPostDetailView: Bool = false
    @Published var seletedPostID: String = ""

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryPostListUseCase: any QueryPostListUseCase

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryPostListUseCase: any QueryPostListUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryPostListUseCase = queryPostListUseCase
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                postContent = try await queryPostListUseCase(postType: .employment)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func seletePost(postID: String) {
        seletedPostID = postID
    }
}
