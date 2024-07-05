import SwiftUI

struct MaxRegisteredUserView: View {
    @Binding var maxRegisteredUser: Int
    let onSelectMaxRegisteredUser: (Int) -> Void

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "최대 수강 인원",
                font: .text1
            )

            TextField(
                "최대 수강 인원 입력",
                value: $maxRegisteredUser,
                formatter: NumberFormatter()
            )
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.bitgouel(.greyscale(.g7)))
            }
        }
    }
}
