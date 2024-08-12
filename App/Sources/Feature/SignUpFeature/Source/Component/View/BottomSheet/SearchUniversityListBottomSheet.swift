import SwiftUI

struct SearchUniversityListBottomSheet: View {
    @State var searchKeyword: String = ""
    let universityList: [String]
    let selectedUniversity: String?
    let onUniversitySelect: (String) -> Void
    
    var searchedUniversityList: [String] {
        if searchKeyword.isEmpty {
            return universityList
        } else {
            return universityList.filter {
                $0.contains(searchKeyword)
            }
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "대학 이름으로 검색",
                text: $searchKeyword
            )

            ScrollView {
                LazyVStack {
                    ForEach(searchedUniversityList, id: \.self) { university in
                        RadioButtonListRow(
                            element: university,
                            selectedElement: selectedUniversity
                        ) { university in
                            onUniversitySelect(university)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 415)
    }
}
