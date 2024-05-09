import SwiftUI

struct CreditView: View {
    let creditValue: [Int] = [1, 2]
    @Binding var selectedCredit: Int
    let onSelectedCrdit: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "학점",
                font: .text1
            )

            HStack(spacing: 16) {
                ForEach(creditValue, id: \.self) { credit in
                    TypeSelectedButton(
                        text: "\(credit)점",
                        isSelected: Binding(
                            get: { credit == selectedCredit },
                            set: { _ in onSelectedCrdit(credit) }
                        )
                    )
                }
            }
        }
    }
}
