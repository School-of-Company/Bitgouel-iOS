import Foundation
import Service

// swiftlint: disable identifier_name
final class PostListViewModel: BaseViewModel {
    @Published var postContent: PostContentEntity?
    @Published var authority: UserAuthorityType = .user

    @Published var isPresentedNoticeListView: Bool = false
    @Published var isPresentedInquiryView: Bool = false
    @Published var isPresentedInputPostView: Bool = false
    @Published var isPresentedPostDetailView: Bool = false
    @Published var isShowingLoginAlert: Bool = false

    @Published var seletedPostID: String = ""

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchPostListUseCase: any FetchPostListUseCase
    // swiftlint: enable identifier_name

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchPostListUseCase: any FetchPostListUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchPostListUseCase = fetchPostListUseCase
    }

    @MainActor
    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        switch authority {
        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            Task {
                do {
                    postContent = try await fetchPostListUseCase(postType: .employment)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func seletePost(postID: String) {
        seletedPostID = postID
    }
}
