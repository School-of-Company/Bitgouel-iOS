import Service
import SwiftUI

struct SelectedLectureTypeView: View {
    var lectureTypeList: [LectureType]
    var selectedLectureType: LectureType
    var onSelectLectureType: (LectureType) -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "강의 유형",
                    font: .text1
                )

                VStack(alignment: .leading, spacing: 16) {
                    ForEach(lectureTypeList, id: \.self) { lectureType in
                        SelectedLectureDetailButton(
                            text: lectureType.display(),
                            isSelected: Binding(
                                get: { selectedLectureType == lectureType },
                                set: { isSelected in
                                    if isSelected {
                                        onSelectLectureType(lectureType)
                                    }
                                }
                            )
                        )
                    }
                }
            }
        }
    }
}
