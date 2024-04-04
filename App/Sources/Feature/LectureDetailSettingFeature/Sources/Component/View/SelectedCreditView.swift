import SwiftUI

struct SelectedCreditView: View {
    let creditList: [Int]
    var selectedCredit: Int
    let onSelectCredit: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "학점",
                font: .text1
            )

            HStack(spacing: 16) {
                ForEach(creditList, id: \.self) { credit in
                    SelectedLectureDetailButton(
                        text: "\(credit)점",
                        isSelected: Binding(
                            get: { selectedCredit == credit },
                            set: { isSelected in
                                if isSelected {
                                    onSelectCredit(credit)
                                }
                            }
                        )
                    )
                }
            }
        }
    }
}
