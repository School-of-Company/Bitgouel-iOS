import Service
import SwiftUI

struct SelectedDivisionView: View {
    var selectedDivision: String
    @State var isShowingDivisionBottomSheet: Bool = false
    let onSelectDivision: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "강의 구분",
                font: .text1
            )

            PickerTextField(
                "구분 선택",
                text: selectedDivision
            ) {
                if isShowingDivisionBottomSheet {
                    onSelectDivision(false)
                } else {
                    onSelectDivision(true)
                }
            }
        }
    }
}
