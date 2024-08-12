import SwiftUI

struct InputCheckPasswordSection: View {
    let password: String
    let checkPassword: String
    @State var isCheckPasswordErrorOccurred: Bool = false

    var checkPasswordHelpMessage: String {
        guard !checkPassword.isEmpty else { return "" }

        if isCheckPasswordErrorOccurred {
            return "비밀번호가 일치하지 않습니다"
        } else {
            return ""
        }
    }

    var body: some View {
        SecureBitgouelTextField(
            "비밀번호",
            text: Binding(
                get: { checkPassword },
                set: { newValue in
                    if checkedPassword() {
                        isCheckPasswordErrorOccurred = false
                    } else {
                        isCheckPasswordErrorOccurred = true
                    }
                }
            ),
            helpMessage: checkPasswordHelpMessage,
            isError: isCheckPasswordErrorOccurred
        )
        .textContentType(.password)
    }

    func checkedPassword() -> Bool {
        return password == checkPassword
    }
}
