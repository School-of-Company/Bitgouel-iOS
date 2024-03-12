import SwiftUI

struct PostDetailSettingView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: PostDetailSettingViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LinkDetailSettingView(
                    links: viewModel.inputLinks,
                    link: viewModel.link,
                    dismiss: dismiss
                ) { links in
                    viewModel.applyButtonDidTap(link: links)
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
            .onAppear {
                tabbarHidden.wrappedValue = true
            }
        }
    }
}
