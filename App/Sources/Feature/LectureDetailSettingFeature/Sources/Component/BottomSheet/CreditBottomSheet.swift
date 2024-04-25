import SwiftUI

struct CreditBottomSheet: View {
    var selectedCredit: Int
    let creditList: [Int]
    let creditDidSelect: (Int) -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(creditList, id: \.self) { credit in
                    creditListRow(
                        credit: credit,
                        isSelected: Binding(
                            get: { credit == selectedCredit },
                            set: { _ in creditDidSelect(credit) }
                        )
                    )
                }
            }
        }
    }

    @ViewBuilder
    func creditListRow(
        credit: Int,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            BitgouelText(
                text: "\(credit)",
                font: .text2
            )

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(String(credit))
        .padding(.horizontal, 28)
        .padding(.vertical, 24)
    }
}
