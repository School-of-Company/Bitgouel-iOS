import Foundation
import Service

final class NoticeDetailViewModel: BaseViewModel {
    @Published var isDeleteNotice: Bool = false
    @Published var noticeID: String = ""
    @Published var isPresentedEditView: Bool = false

    init(
        noticeID: String
    ) {
        self.noticeID = noticeID
    }

    func updateIsPresentedEditView(isPresented: Bool) {
        isPresentedEditView = isPresented
    }

    func updateIsDeleteNotice(isDelete: Bool) {
        isDeleteNotice = isDelete
    }

    func onAppear() {
        #warning("TODO: 공지사항 상세 조회 기능 추가")
    }

    func deleteNotice() {
        #warning("공지사항 삭제 기능 추가")
    }
}

