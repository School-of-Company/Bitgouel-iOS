import Service
import SwiftUI

struct SelectedSemesterView: View {
    let springSemesterList: [SpringSemesterType]
    let fallSemesterList: [FallSemesterType]
    var selectedSemester: SemesterType
    let onSelectSemester: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "수강 학기",
                font: .text1
            )

            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(fallSemesterList, id: \.self) { semester in
                        SelectedLectureDetailButton(
                            text: semester.display(),
                            isSelected: Binding(
                                get: { selectedSemester.rawValue == semester.rawValue },
                                set: { isSelected in
                                    if isSelected {
                                        onSelectSemester(semester.rawValue)
                                    }
                                }
                            )
                        )
                    }
                }

                VStack(alignment: .leading, spacing: 16) {
                    ForEach(springSemesterList, id: \.self) { semester in
                        SelectedLectureDetailButton(
                            text: semester.display(),
                            isSelected: Binding(
                                get: { selectedSemester.rawValue == semester.rawValue },
                                set: { isSelected in
                                    if isSelected {
                                        onSelectSemester(semester.rawValue)
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
