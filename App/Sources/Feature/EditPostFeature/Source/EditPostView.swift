import SwiftUI

struct EditPostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditPostViewModel

    private let postDetailSettingFactory: any PostDetailSettingFactory

    init(
        viewModel: EditPostViewModel,
        postDetailSettingFactory: any PostDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.postDetailSettingFactory = postDetailSettingFactory
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InputFormView(
                    epic: "게시글",
                    state: "수정",
                    settingButtonAction: {
                        viewModel.isPresentedDetailSetting(state: true)
                    },
                    finalButtonAction: {
                        viewModel.updatePost()
                        dismiss()
                    },
                    title: Binding(
                        get: { viewModel.modifiedTitle },
                        set: { title in viewModel.updateTitle(title: title) }
                    ),
                    text: Binding(
                        get: { viewModel.modifiedContent },
                        set: { text in viewModel.updateContent(content: text) }
                    )
                )
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedPostDetailSettingAppend },
                set: { _ in viewModel.isPresentedDetailSetting(state: false) }
            )
        ) {
            DeferView {
                postDetailSettingFactory.makeView(links: viewModel.modifiedLinks) { links in
                    viewModel.updateLinks(links: links)
                }.eraseToAnyView()
            }
        }
    }
}
