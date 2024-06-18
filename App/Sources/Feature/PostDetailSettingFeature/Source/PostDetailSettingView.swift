import SwiftUI

struct PostDetailSettingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: PostDetailSettingViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LinkDetailSettingView(
                    links: viewModel.inputLinks,
                    dismiss: dismiss
                ) { links in
                    viewModel.applyButtonDidTap(links: links)
                }
            }
            .padding(.horizontal, 28)
            .navigationTitle("게시글 세부 설정")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelAsset.Icons.cancel.swiftUIImage
                    }
                }
            }
        }
    }
}
