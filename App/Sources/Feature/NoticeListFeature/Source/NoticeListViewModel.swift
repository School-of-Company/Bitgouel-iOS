import Foundation
import Service

final class NoticeListViewModel: BaseViewModel {
    @Published var isPresentedInquiryListView: Bool = false
    @Published var isPresentedNoticeDetailView: Bool = false
    var noticeContent: PostContentEntity? {
        get {
            _noticeContent.map {
                PostContentEntity(content: $0.content)
            }
        } set { _noticeContent = newValue }
    }
    @Published var _noticeContent: PostContentEntity?
    @Published var noticeID: String = ""

    private let queryPostListUseCase: any QueryPostListUseCase

    init(queryPostListUseCase: any QueryPostListUseCase) {
        self.queryPostListUseCase = queryPostListUseCase
    }

    func updateIsPresentedInquiryListView(isPresented: Bool) {
        isPresentedInquiryListView = isPresented
    }

    func updateIsPresentedNoticeDetailView(isPresented: Bool) {
        isPresentedNoticeDetailView = isPresented
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                noticeContent = try await queryPostListUseCase(postType: .notice)
            } catch {
                print(String(describing: error))
            }
        }
    }
}
