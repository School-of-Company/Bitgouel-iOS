import Service
import SwiftUI

struct SelectedDivisionView: View {
    let industryDivisionList: [IndustryDivisionType]
    let otherDivisionList: [OtherDivisionType]
    var selectedDivision: DivisionType
    let onSelectDivision: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "강의 구분",
                font: .text1
            )

            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(industryDivisionList, id: \.self) { division in
                        SelectedLectureDetailButton(
                            text: division.display(),
                            isSelected: Binding(
                                get: { selectedDivision.rawValue == division.rawValue },
                                set: { isSelected in
                                    if isSelected {
                                        onSelectDivision(division.rawValue)
                                    }
                                }
                            )
                        )
                    }
                }

                VStack(alignment: .leading, spacing: 16) {
                    ForEach(otherDivisionList, id: \.self) { division in
                        SelectedLectureDetailButton(
                            text: division.display(),
                            isSelected: Binding(
                                get: { selectedDivision.rawValue == division.rawValue },
                                set: { isSelected in
                                    if isSelected {
                                        onSelectDivision(
                                            division.rawValue
                                        )
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
