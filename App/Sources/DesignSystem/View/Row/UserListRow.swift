import SwiftUI

public struct UserListRow: View {
    let name: String
    let authoruty: String
    let phoneNumber: String
    let email: String
    @State var isToggle: Bool = false

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                BitgouelText(
                    text: name,
                    font: .text1
                )

                BitgouelText(
                    text: authoruty,
                    font: .text3
                )
                .foregroundColor(.bitgouel(.greyscale(.g4)))

                Spacer()

                toggleButton()
            }

            if isToggle {
                userInfoView()
            }
        }
    }

    @ViewBuilder
    func userInfoView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                BitgouelText(
                    text: "전화번호",
                    font: .caption
                )
                .foregroundColor(.bitgouel(.greyscale(.g4)))

                BitgouelText(
                    text: phoneNumber,
                    font: .caption
                )
                .foregroundColor(.bitgouel(.greyscale(.g7)))
            }

            HStack(spacing: 4) {
                BitgouelText(
                    text: "이메일",
                    font: .caption
                )
                .foregroundColor(.bitgouel(.greyscale(.g4)))

                BitgouelText(
                    text: email,
                    font: .caption
                )
                .foregroundColor(.bitgouel(.greyscale(.g7)))
            }
        }
    }

    @ViewBuilder
    func toggleButton() -> some View {
        if isToggle {
            Button {
                isToggle = false
            } label: {
                BitgouelAsset.Icons.chevronDown.swiftUIImage
            }
        } else {
            Button {
                isToggle = true
            } label: {
                BitgouelAsset.Icons.chevronUp.swiftUIImage
            }
        }
    }
}
