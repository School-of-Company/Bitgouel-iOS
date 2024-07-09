import SwiftUI

struct CreditView: View {
    @Binding var selectedCredit: Int
    let onSelectedCrdit: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "학점",
                font: .text1
            )

            TextField(
                "학점 입력",
                value: $selectedCredit,
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
