import SwiftUI

struct MaxRegisteredUser: View {
    @Binding var maxRegisteredUser: String
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
                    get: { maxRegisteredUser },
                    set: { selectedMaxRegisteredUser in
                        onSelectMaxRegisteredUser(Int(selectedMaxRegisteredUser))
                    }
                )
            )
        }
    }
}
