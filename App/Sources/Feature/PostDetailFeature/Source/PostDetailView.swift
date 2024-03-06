import SwiftUI

struct PostDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: PostDetailViewModel

    private let editPostFactory: any EditPostFactory

    init(
        viewModel: PostDetailViewModel,
        editPostFactory: any EditPostFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.editPostFactory = editPostFactory
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
                viewModel.editAction()
            },
            isDelete: Binding(
                get: { viewModel.isPostDelete },
                set: { value in viewModel.isPostDelete = value }
            )
        )
        .onAppear {
            viewModel.onAppear()
            tabbarHidden.wrappedValue = true
        }
        .onDisappear {
            tabbarHidden.wrappedValue = false
        }
        .navigate(
            to: editPostFactory.makeView(postID: viewModel.postID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedEditView },
                set: { _ in
                    viewModel.isPresentedEditView = false
                }
            )
        )
    }
}
