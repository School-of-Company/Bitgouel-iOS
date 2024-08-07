import Service
import SwiftUI

struct SemesterBottomSheet: View {
    let semesterList: [SemesterType] = SemesterType.allCases
    let selectedSemester: SemesterType
    let semesterDidSelect: (SemesterType) -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(semesterList, id: \.self) { semester in
                    if semester == .notApplicable {
                        EmptyView()
                    } else {
                        semesterListRow(
                            semester: semester.display(),
                            isSelected: Binding(
                                get: { semester.rawValue == selectedSemester.rawValue },
                                set: { _ in semesterDidSelect(semester) }
                            )
                        )
                        .onTapGesture {
                            semesterDidSelect(semester)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    func semesterListRow(
        semester: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            BitgouelText(
                text: semester,
                font: .text2
            )

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(String(semester))
        .padding(.horizontal, 28)
        .padding(.vertical, 24)
    }
}
