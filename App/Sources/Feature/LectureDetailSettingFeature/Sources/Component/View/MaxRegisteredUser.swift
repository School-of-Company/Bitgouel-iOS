import SwiftUI

struct MaxRegisteredUser: View {
    let maxRegisteredUser: Int
    let onSelectMaxRegisteredUser: (Int?) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "최대 수강 인원",
                font: .text1
            )

            BitgouelTextField(
                "최대 수강 인원 입력",
                text: Binding(
                    get: { String(maxRegisteredUser) },
                    set: { maxRegisteredUser in
                        onSelectMaxRegisteredUser(Int(maxRegisteredUser))
                    }
                )
            )
        }
    }
}
