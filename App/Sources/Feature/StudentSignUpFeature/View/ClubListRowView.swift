import SwiftUI
import Service

struct ClubListRowView: View {
    let club: String
    @Binding var isSelected: Bool

    init(club: String, isSelected: Binding<Bool>) {
        self.club = club
        self._isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            Text(club)
            
            Spacer()
            
            BitgouelRadioButton(isSelected: $isSelected)
        }
        .id(String(club))
        .frame(height: 73)
        .padding(.horizontal, 28)
    }
}
