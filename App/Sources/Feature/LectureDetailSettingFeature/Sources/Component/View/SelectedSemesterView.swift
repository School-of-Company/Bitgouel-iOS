import Service
import SwiftUI

struct SelectedSemesterView: View {
    let selectedSemester: SemesterType
    @State var isShowingSemesterBottomSheet: Bool = false
    let onSelectSemester: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "수강 학기",
                font: .text1
            )

            PickerTextField(
                "학기 선택",
                text: selectedSemester.display()) {
                    if isShowingSemesterBottomSheet {
                        onSelectSemester(false)
                    } else {
                        onSelectSemester(true)
                    }
                }
        }
    }
}
