import SwiftUI

struct PostDetailView: View {
    @StateObject var viewModel: PostDetailViewModel
    
    init(viewModel: PostDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                DetailView(
                    title: viewModel.postTitle,
                    content: viewModel.postContent,
                    links: viewModel.postRelatedLink,
                    deleteAction: {
                        
                    },
                    editAction: {
                        
                    },
                    isDelete: Binding(
                        get: { viewModel.isPostDelete },
                        set: { _ in viewModel.isPostDelete = true }
                    )
                )
            }
        }
    }
}


