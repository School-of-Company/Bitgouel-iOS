import SwiftUI

struct LinkDetailSettingView: View {
    @State var links: [String]
    let link: String
    let dismiss: DismissAction

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                HStack {
                    BitgouelText(
                        text: "링크 입력",
                        font: .text1
                    )

                    Spacer()
                }
                .padding(.top, 28)

                VStack {
                    linkRow()
                }
                .padding(.top, 8)

                Button {
                    links.append("")
                } label: {
                    HStack {
                        Text("링크 추가")

                        Spacer()

                        BitgouelAsset.Icons.add.swiftUIImage
                            .renderingMode(.template)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .foregroundColor(.bitgouel(.greyscale(.g10)))
                    .background(Color.bitgouel(.primary(.p5)))
                    .cornerRadius(8, corners: .allCorners)
                }
                .padding(.top, 8)

            }
            Spacer()

            CTAButton(text: "적용하기") {
                dismiss()
            }
            .padding(.bottom, 12)
        }
    }

    @ViewBuilder
    func linkRow() -> some View {
        ForEach(links.indices, id: \.self) { index in
            BitgouelTextField(
                "링크 입력 (선택)",
                text: Binding(
                    get: { links[index] },
                    set: { newvalue in links[index] = newvalue }
                )
            )
        }
    }
}
