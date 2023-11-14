import SwiftUI

struct ClubListView: View {
    @Binding var searchText: String
    let searchedClubList: [String]
    @Binding var selectedClub: String

    init(
        searchText: Binding<String>,
        searchedClubList: [String],
        selectedClub: Binding<String>
    ) {
        self._searchText = searchText
        self.searchedClubList = searchedClubList
        self._selectedClub = selectedClub
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
                        ClubListRowView(
                            club: club,
                            isSelected: Binding(
                                get: { club == selectedClub },
                                set: { _ in selectedClub = club }
                            )
                        )
                    }
                }
            }
        }
    }
}
