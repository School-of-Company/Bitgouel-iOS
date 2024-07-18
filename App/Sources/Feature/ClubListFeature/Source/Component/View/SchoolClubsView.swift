import Service
import SwiftUI

public struct SchoolClubsView: View {
    let schoolName: String
    let clubList: [ClubInfoModel]
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
                ForEach(clubList, id: \.clubID) { club in
                    ClubListRow(clubName: club.clubName)
                        .onTapGesture {
                            selectedClub(club.clubID)
                        }
                }
            }
            .padding(.top, 8)

            Spacer()
        }
    }
}
