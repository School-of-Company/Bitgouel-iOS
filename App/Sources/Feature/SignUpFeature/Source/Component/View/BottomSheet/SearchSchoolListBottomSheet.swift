import Service
import SwiftUI

struct SearchSchoolListBottomSheet: View {
    @State var searchKeyword: String = ""
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

            ScrollView {
                LazyVStack {
                    ForEach(searchedSchoolList, id: \.self) { school in
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
        .padding(.horizontal, 28)
        .frame(height: 415)
    }
}
