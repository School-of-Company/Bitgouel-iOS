import SwiftUI

struct NoticeDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NoticeDetailViewModel

    init(
        viewModel: NoticeDetailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                viewModel.updateIsPresentedEditView(isPresented: true)
            },
            isDelete: Binding(
                get: { viewModel.isDeleteNotice },
                set: { isDelete in viewModel.updateIsDeleteNotice(isDelete: isDelete) }
            )
        )
        .onAppear {
            viewModel.onAppear()
        }
    }
}
