import SwiftUI

struct PostDetailView: View {
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
            title: viewModel.postTitle,
            content: viewModel.postContent,
            links: viewModel.postRelatedLink,
            deleteAction: {
            },
            editAction: {
                viewModel.editAction()
            },
            isDelete: Binding(
                get: { viewModel.isPostDelete },
                set: { value in viewModel.isPostDelete = value }
            )
        )
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
