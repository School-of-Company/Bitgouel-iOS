import SwiftUI

struct MaxRegisteredUserView: View {
    @Binding var maxRegisteredUser: Int
    let onSelectMaxRegisteredUser: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "최대 수강 인원",
                font: .text1
            )

            PickerTextField(
                "최대 수강 인원 선택",
                text: "\(maxRegisteredUser)명"
            ) {
                onSelectMaxRegisteredUser(true)
            }
        }
    }
}
