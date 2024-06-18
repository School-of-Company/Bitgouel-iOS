import Service
import SwiftUI

struct SearchClubListRow: View {
    let club: String
    let selectedClub: String?
    let onClubSelect: (String) -> Void

    var body: some View {
        HStack {
            Text(club)

            Spacer()

            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedClub == club },
                    set: { isSelected in
                        if isSelected {
                            onClubSelect(club)
                        }
                    }
                )
            )
        }
        .onTapGesture {
            onClubSelect(club)
        }
        .id(String(club))
        .frame(height: 73)
        .padding(.horizontal, 28)
    }
}
