import SwiftUI

struct InputEmailSection: View {
    let email: String
    var emailHelpMessage: String {
        guard !email.isEmpty else { return "" }

        if isEmailErrorOccurred {
            return "이메일 형식이 유효하지 않습니다"
        } else {
            return ""
        }
    }

    @State var isEmailErrorOccurred: Bool = false
    let updateState: (SignupFlowState) -> Void
    let enteredEmail: (String) -> Void

    var body: some View {
        BitgouelTextField(
            "이메일",
            text: Binding(
                get: { email },
                set: { newValue in
                    enteredEmail(newValue)

                    if newValue.checkEmail() {
                        isEmailErrorOccurred = false
                        updateState(.password)
                    } else {
                        isEmailErrorOccurred = true
                        enteredEmail(newValue)
                    }
                }
            ),
            helpMessage: emailHelpMessage,
            isError: isEmailErrorOccurred
        )
        .textContentType(.emailAddress)
    }
}
