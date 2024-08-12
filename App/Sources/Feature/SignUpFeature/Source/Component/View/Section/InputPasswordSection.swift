import SwiftUI

struct InputPasswordSection: View {
    let password: String
    var passwordHelpMessage: String {
        guard !password.isEmpty else { return "" }

        if isPasswordErrorOccurred {
            return "비밀번호는 (정규식)으로 해주세요"
        } else {
            return ""
        }
    }
    @State var isPasswordErrorOccurred: Bool = false
    let updateState: (SignupFlowState) -> Void
    let enteredPassword: (String) -> Void

    var body: some View {
        SecureBitgouelTextField(
            "비밀번호",
            text: Binding(
                get: { password },
                set: { newValue in
                    enteredPassword(newValue)

                    if newValue.checkPassword() {
                        isPasswordErrorOccurred = false
                        updateState(.checkPassword)
                    } else {
                        isPasswordErrorOccurred = true
                    }
                }
            ),
            helpMessage: passwordHelpMessage,
            isError: isPasswordErrorOccurred
        )
        .textContentType(.password)
    }
}
