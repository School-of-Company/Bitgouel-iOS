import SwiftUI
import Service

struct ClubListRowView: View {
    @ObservedObject var viewModel: StudentSignUpViewModel
    let club: String
    
    var body: some View {
        HStack {
            Text(club)
            
            Spacer()
            
            BitgouelRadioButton(
                isSelected: Binding(
                    get: { viewModel.clubResult == club },
                    set: { careerClub in
                        if careerClub {
                            viewModel.clubResult = club
                        }
                    }
                ))
        }
        .id(String(club))
        .frame(height: 73)
        .padding(.horizontal, 28)
    }
}
