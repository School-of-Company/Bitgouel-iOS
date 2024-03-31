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
        DetailView(
            title: viewModel.postDetail?.title ?? "",
            content: viewModel.postDetail?.content ?? "",
            links: viewModel.postDetail?.links ?? [""],
            writtenBy: viewModel.postDetail?.writtenBy ?? false,
            deleteAction: {
                viewModel.postDelete()
                dismiss()
            },
            editAction: {
                viewModel.updateIsPresentedInputPostView(isPresented: true)
            },
            isDelete: Binding(
                get: { viewModel.isPostDelete },
                set: { value in viewModel.isPostDelete = value }
            )
        )
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
    }
}
