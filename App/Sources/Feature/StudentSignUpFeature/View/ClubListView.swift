import SwiftUI

struct ClubListView: View {
    @ObservedObject var viewModel: StudentSignUpViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "동아리 이름으로 검색",
                text: $viewModel.club
            )
            .padding(.horizontal, 28)
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchClub, id: \.self) { club in
                        ClubListRowView(viewModel: viewModel, club: club)
                    }
                }
            }
        }
    }
}
