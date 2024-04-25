import Service
import SwiftUI

struct SelectedLectureTypeView: View {
    var selectedLectureType: LectureType
    var selectedLectureTypeString: String
    @State var isShowingLectureTypeBottomSheet: Bool = false
    let onSelectLectureType: (Bool) -> Void
    let onChangeSelectedLectureType: (String) -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "강의 유형",
                    font: .text1
                )

                PickerTextField(
                    "유형 선택",
                    text: selectedLectureType.rawValue
                ) {
                    if isShowingLectureTypeBottomSheet {
                        onSelectLectureType(false)
                    } else {
                        onSelectLectureType(true)
                    }
                }

                if selectedLectureType == .etc {
                    TextField(
                        "",
                        text: Binding(
                            get: { selectedLectureTypeString },
                            set: { text in
                                onChangeSelectedLectureType(text)
                            }
                        )
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
    }
}
