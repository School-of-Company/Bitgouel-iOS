import SwiftUI

struct InputNoticeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InputNoticeViewModel
    
    init(viewModel: InputNoticeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        InputFormView(
            epic: "공지사항",
            state: viewModel.state,
            settingButtonAction: {
                viewModel.updateIsPresentedNoticeSettingView(isPresented: true)
            },
            finalButtonAction: {
                viewModel.applyButtonDidTap()
                dismiss()
            },
            title: Binding(
                get: { viewModel.noticeTitle },
                set: { title in viewModel.updateNoticeTitle(title: title) }
            ),
            text: Binding(
                get: { viewModel.noticeContent },
                set: { content in viewModel.updateNoticeContent(content: content) }
            )
        )
        .onAppear {
            viewModel.onAppear()
        }
    }
}
