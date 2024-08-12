import SwiftUI

struct InputNameSection: View {
    let name: String
    let enteredName: (String) -> Void
    let updateState: () -> Void

    var body: some View {
        BitgouelTextField(
            "이름",
            text: Binding(
                get: { name },
                set: { newValue in
                    enteredName(newValue)

                    if checkName() {
                        updateState()
                    }
                }
            )
        )
        .padding(.bottom, -20)
    }

    func checkName() -> Bool {
        return name.count >= 2
    }
}
