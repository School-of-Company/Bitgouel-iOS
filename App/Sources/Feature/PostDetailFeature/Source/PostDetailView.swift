import SwiftUI

struct PostDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: PostDetailViewModel

    private let inputPostFactory: any InputPostFactory

    init(
        viewModel: PostDetailViewModel,
        inputPostFactory: any InputPostFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputPostFactory = inputPostFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                DetailView(
                    title: viewModel.postDetail?.title ?? "",
                    content: viewModel.postDetail?.content ?? "",
                    writer: viewModel.postDetail?.writer ?? "",
                    modifiedAt: viewModel.postDetail?.modifiedAt.toStringCustomFormat(format: "yyyy.MM.dd") ?? "",
                    links: viewModel.postDetail?.links ?? [""],
                    writtenBy: viewModel.postDetail?.writtenBy ?? false,
                    deleteAction: {
                        viewModel.postDelete {
                            dismiss()
                        }
                    },
                    editAction: {
                        viewModel.updateIsPresentedInputPostView(isPresented: true)
                    },
                    isDelete: Binding(
                        get: { viewModel.isPostDelete },
                        set: { value in viewModel.isPostDelete = value }
                    )
                )
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigate(
            to: inputPostFactory.makeView(state: "수정", postID: viewModel.postID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputPostView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputPostView(isPresented: isPresented)
                }
            )
        )
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
