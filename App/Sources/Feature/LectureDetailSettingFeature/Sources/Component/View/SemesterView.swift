import Service
import SwiftUI

struct SemesterView: View {
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
                text: selectedSemester.display(),
                backgroundColor: selectedSemester == .notApplicable ? Color.bitgouel(.greyscale(.g8)) : .clear,
                action: {
                    guard selectedSemester != .notApplicable else { return }

                    if isShowingSemesterBottomSheet {
                        onSelectSemester(false)
                    } else {
                        onSelectSemester(true)
                    }
                }
            )
        }
    }
}
