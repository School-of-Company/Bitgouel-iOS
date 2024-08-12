import SwiftUI

struct SearchClubListBottomSheet: View {
    @Binding var searchText: String
    let searchedClubList: [String]
    let selectedClub: String
    let onClubSelect: (String) -> Void

    init(
        searchText: Binding<String>,
        searchedClubList: [String],
        selectedClub: String,
        onClubSelect: @escaping (String) -> Void
    ) {
        self._searchText = searchText
        self.searchedClubList = searchedClubList
        self.selectedClub = selectedClub
        self.onClubSelect = onClubSelect
    }

    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "동아리 이름으로 검색",
                text: $searchText
            )
            .padding(.horizontal, 28)

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
    }
}
