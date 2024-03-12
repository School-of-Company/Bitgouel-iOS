import SwiftUI

struct NoticeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: NoticeDetailViewModel

    private let inputNoticeFactory: any InputNoticeFactory

    init(
        viewModel: NoticeDetailViewModel,
        inputNoticeFactory: any InputNoticeFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputNoticeFactory = inputNoticeFactory
    }

    var body: some View {
        DetailView(
            title: viewModel.noticeDetail?.title ?? "",
            content: viewModel.noticeDetail?.content ?? "",
            links: viewModel.noticeDetail?.links ?? [""],
            writtenBy: viewModel.noticeDetail?.writtenBy ?? false,
            deleteAction: {
                viewModel.deleteNotice()
                dismiss()
            },
            editAction: {
                viewModel.updateIsPresentedInputNoticeView(isPresented: true)
            },
            isDelete: Binding(
                get: { viewModel.isDeleteNotice },
                set: { isDelete in viewModel.updateIsDeleteNotice(isDelete: isDelete) }
            )
        )
        .navigate(
            to: inputNoticeFactory.makeView(
                state: "수정",
                noticeID: viewModel.noticeID
            ).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputNoticeView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputNoticeView(isPresented: isPresented)
                }
            )
        )
        .onAppear {
            viewModel.onAppear()
            tabbarHidden.wrappedValue = true
        }
        .onDisappear {
            if !viewModel.isPresentedInputNoticeView {
                tabbarHidden.wrappedValue = false
            }
        }
    }
}
