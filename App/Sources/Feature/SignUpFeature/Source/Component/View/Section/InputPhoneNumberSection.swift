import SwiftUI

struct InputPhoneNumberSection: View {
    let phoneNumber: String
    var phoneNumberHelpMessage: String {
        guard !phoneNumber.isEmpty else { return "" }

        if isPhoneNumberErrorOccurred {
            return "전화번호는 010으로 시작하고 11자 이상이어야 합니다."
        } else {
            return ""
        }
    }
    @State var isPhoneNumberErrorOccurred: Bool = false
    let updateState: (SignupFlowState) -> Void

    var body: some View {
        BitgouelTextField(
            "전화번호",
            text: Binding(
                get: { phoneNumber },
                set: { newValue in
                    if newValue.checkphoneNumber() {
                        isPhoneNumberErrorOccurred = false
                        updateState(.email)
                    } else {
                        isPhoneNumberErrorOccurred = true
                    }
                }
            ),
            helpMessage: phoneNumberHelpMessage,
            isError: isPhoneNumberErrorOccurred
        )
    }
}
