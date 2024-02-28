import Foundation
import Service

final class NoticeDetailViewModel: BaseViewModel {
    @Published var isDeleteNotice: Bool = false
    @Published var noticeID: String = ""
    @Published var isPresentedEditView: Bool = false
    @Published var noticeDetail: PostDetailEntity?

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

    func updateIsPresentedEditView(isPresented: Bool) {
        isPresentedEditView = isPresented
    }

    func updateIsDeleteNotice(isDelete: Bool) {
        isDeleteNotice = isDelete
    }

    func onAppear() {
        Task {
            do {
                noticeDetail = try await queryPostDetailUseCase(postID: noticeID)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func deleteNotice() {
        Task {
            do {
                try await deletePostUseCase(postID: noticeID)
                print("공지사항 삭제 완료")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

