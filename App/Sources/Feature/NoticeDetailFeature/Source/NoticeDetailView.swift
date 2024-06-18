import SwiftUI

struct NoticeDetailView: View {
    @Environment(\.dismiss) var dismiss
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
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                DetailView(
                    title: viewModel.noticeDetail?.title ?? "",
                    content: viewModel.noticeDetail?.content ?? "",
                    writer: viewModel.noticeDetail?.writer ?? "",
                    modifiedAt: viewModel.noticeDetail?.modifiedAt.toStringCustomFormat(format: "yyyy.MM.dd") ?? "",
                    links: viewModel.noticeDetail?.links ?? [""],
                    writtenBy: viewModel.noticeDetail?.writtenBy ?? false,
                    deleteAction: {
                        viewModel.deleteNotice {
                            dismiss()
                        }
                    },
                    editAction: {
                        viewModel.updateIsPresentedInputNoticeView(isPresented: true)
                    },
                    isDelete: Binding(
                        get: { viewModel.isDeleteNotice },
                        set: { isDelete in viewModel.updateIsDeleteNotice(isDelete: isDelete) }
                    )
                )
            }
        }
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
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
