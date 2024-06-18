import Foundation
import Service

final class NoticeListViewModel: BaseViewModel {
    @Published var isPresentedInquiryListView: Bool = false
    @Published var isPresentedNoticeDetailView: Bool = false
    @Published var isPresentedInputNoticeView: Bool = false
    var noticeContent: PostContentEntity? {
        get {
            _noticeContent.map {
                PostContentEntity(content: $0.content)
            }
        } set { _noticeContent = newValue }
    }

    // swiftlint: disable identifier_name
    @Published var _noticeContent: PostContentEntity?
    @Published var noticeID: String = ""
    var authority: UserAuthorityType = .user
    // swiftlint: enable identifier_name

    private let fetchPostListUseCase: any FetchPostListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        fetchPostListUseCase: any FetchPostListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.fetchPostListUseCase = fetchPostListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateIsPresentedInquiryListView(isPresented: Bool) {
        isPresentedInquiryListView = isPresented
    }

    func updateIsPresentedNoticeDetailView(isPresented: Bool) {
        isPresentedNoticeDetailView = isPresented
    }

    func updateIsPresentedInputNoticeView(isPresented: Bool) {
        isPresentedInputNoticeView = isPresented
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                noticeContent = try await fetchPostListUseCase(postType: .notice)

                isLoading = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
