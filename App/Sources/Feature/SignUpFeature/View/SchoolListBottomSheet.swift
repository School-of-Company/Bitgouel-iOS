import Service
import SwiftUI

struct SchoolListBottomSheet: View {
    let searchKeyword: Binding<String>
    let schoolList: [HighSchoolType]
    let selectedSchool: HighSchoolType?
    let onHighSchoolSelect: (HighSchoolType) -> Void

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "학교 이름으로 검색",
                text: searchKeyword
            )
            .padding(.horizontal, 28)

            ScrollView {
                LazyVStack {
                    ForEach(schoolList, id: \.self) { school in
                        SchoolListRow(
                            school: school,
                            selectedSchool: selectedSchool,
                            onHighSchoolSelect: onHighSchoolSelect
                        )
                    }
                }
            }
        }
    }
}
