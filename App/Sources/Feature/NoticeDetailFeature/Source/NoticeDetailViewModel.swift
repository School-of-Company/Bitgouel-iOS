import Foundation
import Service

final class NoticeDetailViewModel: BaseViewModel {
    @Published var isDeleteNotice: Bool = false
    @Published var noticeID: String = ""
    @Published var noticeDetail: PostDetailEntity?
    @Published var isPresentedInputNoticeView: Bool = false

    private let fetchPostDetailUseCase: any FetchPostDetailUseCase
    private let deletePostUseCase: any DeletePostUseCase

    init(
        noticeID: String,
        fetchPostDetailUseCase: any FetchPostDetailUseCase,
        deletePostUseCase: any DeletePostUseCase
    ) {
        self.noticeID = noticeID
        self.fetchPostDetailUseCase = fetchPostDetailUseCase
        self.deletePostUseCase = deletePostUseCase
    }

    func updateIsPresentedInputNoticeView(isPresented: Bool) {
        isPresentedInputNoticeView = isPresented
    }

    func updateIsDeleteNotice(isDelete: Bool) {
        isDeleteNotice = isDelete
    }

    @MainActor
    func onAppear() {
        isLoading = true

        Task {
            do {
                noticeDetail = try await fetchPostDetailUseCase(postID: noticeID)

                isLoading = false
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func deleteNotice(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deletePostUseCase(postID: noticeID)

                success()
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
