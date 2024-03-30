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
        ScrollView {
            InputFormView(
                epic: "게시글",
                state: "추가",
                settingButtonAction: {
                    viewModel.isPresentedDetailSetting(state: true)
                },
                finalButtonAction: {
                    viewModel.addPost()
                    dismiss()
                },
                title: Binding(
                    get: { viewModel.postTitle },
                    set: { title in viewModel.postTitle = title }
                ),
                text: Binding(
                    get: { viewModel.postText },
                    set: { text in viewModel.postText = text }
                )
            )
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedPostDetailSettingAppend },
                set: { _ in viewModel.isPresentedDetailSetting(state: false) }
            )
        ) {
            DeferView {
                postDetailSettingFactory.makeView(links: viewModel.postRelatedLink) { links in
                    viewModel.postRelatedLink = links
                }.eraseToAnyView()
            }
        }
    }
}
