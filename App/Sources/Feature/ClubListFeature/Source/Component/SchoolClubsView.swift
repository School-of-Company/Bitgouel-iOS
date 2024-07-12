import Service
import SwiftUI

public struct SchoolClubsView: View {
    let schoolName: String
    let clubList: [ClubEntity]
    let selectedClub: (_ clubID: Int) -> Void

    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                BitgouelText(
                    text: schoolName,
                    font: .title3
                )

                Spacer()
            }
            .padding(.top, 40)

            Divider()
                .padding(.top, 12)

            LazyVStack(spacing: 0) {
                ForEach(clubList, id: \.id) { club in
                    ClubListRow(clubName: club.name)
                        .onTapGesture {
                            selectedClub(club.id)
                        }
                }
            }
            .padding(.top, 8)

            Spacer()
        }
    }
}
