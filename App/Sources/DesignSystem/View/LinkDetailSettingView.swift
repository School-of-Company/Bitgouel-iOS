import SwiftUI

struct LinkDetailSettingView: View {
    @State var links: [String]
    @State var isErrorOccurred: Bool = false
    let dismiss: DismissAction
    var applyButtonTapAction: ([String]) -> Void

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

            BitgouelButton(
                text: "적용하기",
                style: .primary
            ) {
                if validateLinks() {
                    applyButtonTapAction(links)
                    dismiss()
                } else {
                    isErrorOccurred = true
                }
            }
            .padding(.bottom, 12)
        }
        .bitgouelToast(
            text: "유효하지 않은 URL입니다.",
            isShowing: $isErrorOccurred
        )
    }

    @ViewBuilder
    func linkRow() -> some View {
        ForEach(links.indices, id: \.self) { index in
            BitgouelTextField(
                "링크 입력 (선택)",
                text: $links[index]
            )
        }
    }

    func validateLinks() -> Bool {
        let isLinkErrorOccurred = links.map { !checkLink($0) }
        return !isLinkErrorOccurred.contains(true)
    }

    func checkLink(_ link: String) -> Bool {
        let linkRegex = "^https://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}(/[a-zA-Z0-9.-]*)?$"
        return NSPredicate(format: "SELF MATCHES %@", linkRegex).evaluate(with: link)
    }
}
