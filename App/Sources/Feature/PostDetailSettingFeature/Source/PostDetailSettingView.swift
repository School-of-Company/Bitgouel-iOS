import SwiftUI

struct PostDetailSettingView: View {
    @Environment(\.dismiss) var dismiss
    @State private var links: [String?] = Array(repeating: nil, count: 4)
    @State var link: String = ""
    @State var postId: Int = 4
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    BitgouelText(
                        text: "링크 입력",
                        font: .text1
                    )
                    
                    Spacer()
                }
                .padding(.top, 28)
                
                VStack {
                    ForEach(0...3, id: \.self) { index in
                        BitgouelTextField(
                            "링크 입력 (선택)",
                            text: Binding(
                                get: { links[index] ?? "" },
                                set: { newValue in
                                    links[index] = newValue
                                }
                            )
                        )
                    }
                }
                .padding(.top, 8)
                
                Spacer()
                
                CTAButton(text: "적용하기") {
                    dismiss()
                }
                .padding(.bottom, 12)
                
            }
            .padding(.horizontal, 28)
            .navigationTitle("게시글 세부설정")
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
