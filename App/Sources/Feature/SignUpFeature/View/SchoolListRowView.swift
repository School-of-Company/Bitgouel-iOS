import Service
import SwiftUI

struct SchoolListRowView: View {
    let school: HighSchoolType
    let selectedSchool: HighSchoolType?
    let onHighSchoolSelect: (HighSchoolType) -> Void

    var body: some View {
        HStack {
            Text(school.display())

            Spacer()

            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedSchool == school },
                    set: { isSelected in
                        if isSelected {
                            onHighSchoolSelect(school)
                        }
                    }
                )
            )
        }
        .id(String(school.rawValue))
        .frame(height: 73)
        .padding(.horizontal, 28)
    }
}
