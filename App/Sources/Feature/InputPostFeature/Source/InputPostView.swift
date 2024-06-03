import SwiftUI

struct InputPostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InputPostViewModel

    private let postDetailSettingFactory: any PostDetailSettingFactory

    init(
        viewModel: InputPostViewModel,
        postDetailSettingFactory: any PostDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postDetailSettingFactory = postDetailSettingFactory
    }

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                InputFormView(
                    epic: "게시글",
                    state: viewModel.state,
                    settingButtonAction: {
                        viewModel.updateIsPresentedPostDetailSettingAppend(isPresented: true)
                    },
                    finalButtonAction: {
                        viewModel.applyButtonDidTap {
                            dismiss()
                        }
                    },
                    title: Binding(
                        get: { viewModel.postTitle },
                        set: { title in viewModel.updatePostTitle(title: title) }
                    ),
                    text: Binding(
                        get: { viewModel.postContent },
                        set: { content in viewModel.updatePostContent(content: content) }
                    )
                )
            }
        }
        .onAppear {
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedPostDetailSettingAppend },
                set: { isPresented in viewModel.updateIsPresentedPostDetailSettingAppend(isPresented: isPresented) }
            )
        ) {
            DeferView {
                postDetailSettingFactory.makeView(links: viewModel.postRelatedLink) { links in
                    viewModel.updatePostLinks(links: links)
                }.eraseToAnyView()
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
