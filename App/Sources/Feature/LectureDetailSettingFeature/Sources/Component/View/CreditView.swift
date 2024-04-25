import SwiftUI

struct CreditView: View {
    var selectedCredit: Int
    @State var isShowingCreditBottomSheet: Bool = false
    let onSelectCredit: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "학점",
                font: .text1
            )

            PickerTextField(
                "학점 선택",
                text: "\(selectedCredit)"
            ) {
                if isShowingCreditBottomSheet {
                    onSelectCredit(false)
                } else {
                    onSelectCredit(true)
                }
            }
        }
    }
}
