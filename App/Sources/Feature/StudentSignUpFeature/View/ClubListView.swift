import SwiftUI

struct ClubListView: View {
    @Binding var searchText: String
    let searchedClubList: [String]
    let selectedClub: String
    let clubDidSelect: (String) -> Void

    init(
        searchText: Binding<String>,
        searchedClubList: [String],
        selectedClub: String,
        clubDidSelect: @escaping (String) -> Void
    ) {
        self._searchText = searchText
        self.searchedClubList = searchedClubList
        self.selectedClub = selectedClub
        self.clubDidSelect = clubDidSelect
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
                                set: { _ in clubDidSelect(club) }
                            )
                        )
                    }
                }
            }
        }
    }
}
