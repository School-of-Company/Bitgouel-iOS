import SwiftUI

struct SearchClubListBottomSheet: View {
    @State var searchKeyword: String = ""
    let clubList: [String]
    let selectedClub: String
    let onClubSelect: (String) -> Void

    var searchedClubList: [String] {
        if searchKeyword.isEmpty {
            return clubList
        } else {
            return clubList.filter { $0.lowercased().contains(searchKeyword.lowercased()) }
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "동아리 이름으로 검색",
                text: $searchKeyword
            )

            ScrollView {
                LazyVStack {
                    ForEach(searchedClubList, id: \.self) { club in
                        RadioButtonListRow(
                            element: club,
                            selectedElement: selectedClub
                        ) { club in
                            onClubSelect(club)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .frame(height: 415)
    }
}
