import Service
import SwiftUI

struct SchoolListBottomSheet: View {
    @State var searchKeyword: String
    let schoolList: [String]
    let selectedSchool: String?
    let onHighSchoolSelect: (String) -> Void

    var searchedSchoolList: [String] {
        if searchKeyword.isEmpty {
            return schoolList
        } else {
            return schoolList.filter { $0.contains(searchKeyword) }
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "학교 이름으로 검색",
                text: $searchKeyword
            )
            .padding(.horizontal, 28)

            ScrollView {
                LazyVStack {
                    ForEach(schoolList, id: \.self) { school in
                        RadioButtonListRow(
                            element: school,
                            selectedElement: selectedSchool
                        ) { school in
                            onHighSchoolSelect(school)
                        }
                    }
                }
            }
        }
        .frame(height: 415)
    }
}
