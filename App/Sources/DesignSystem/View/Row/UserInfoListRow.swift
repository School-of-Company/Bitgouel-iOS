import SwiftUI

public struct UserInfoListRow: View {
    let name: String
    let authoruty: String
    let phoneNumber: String
    let email: String
    let hasCheckButton: Bool
    @State var isToggle: Bool = false
    @Binding var isSelected: Bool

    public init(
        name: String,
        authoruty: String,
        phoneNumber: String,
        email: String,
        hasCheckButton: Bool = false,
        isToggle: Bool = false,
        isSelected: Binding<Bool> = .constant(true)
    ) {
        self.name = name
        self.authoruty = authoruty
        self.phoneNumber = phoneNumber
        self.email = email
        self.hasCheckButton = hasCheckButton
        self.isToggle = isToggle
        _isSelected = isSelected
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                if hasCheckButton {
                    CheckButton(isSelected: $isSelected)
                        .padding(.trailing, 4)
                }

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
