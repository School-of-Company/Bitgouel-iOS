import Foundation
import Service

final class NoticeDetailViewModel: BaseViewModel {
    @Published var isDeleteNotice: Bool = false
    @Published var noticeID: String = ""
    @Published var noticeDetail: PostDetailEntity?
    @Published var isPresentedInputNoticeView: Bool = false

    private let queryPostDetailUseCase: any QueryPostDetailUseCase
    private let deletePostUseCase: any DeletePostUseCase

    init(
        noticeID: String,
        queryPostDetailUseCase: any QueryPostDetailUseCase,
        deletePostUseCase: any DeletePostUseCase
    ) {
        self.noticeID = noticeID
        self.queryPostDetailUseCase = queryPostDetailUseCase
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
        Task {
            do {
                noticeDetail = try await queryPostDetailUseCase(postID: noticeID)
            } catch {
                print(String(describing: error))
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
                print(error.localizedDescription)
            }
        }
    }
}
