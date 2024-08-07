import SwiftUI
import Service

struct ClubFormView: View {
    let clubList: [SchoolWithClubsEntity]
    let editAction: (SchoolWithClubsEntity) -> Void
    let addClubAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            BitgouelText(
                text: "동아리 목록",
                font: .title3
            )

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(clubList, id: \.clubID) { club in
                        clubListRow(clubInfo: club)
                    }

                    Button {
                        addClubAction()
                    } label: {
                        HStack {
                            Text("동아리 추가")

                            Spacer()

                            BitgouelAsset.Icons.add.swiftUIImage
                                .renderingMode(.template)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                        .foregroundColor(.bitgouel(.greyscale(.g10)))
                        .background(Color.bitgouel(.primary(.p5)))
                        .cornerRadius(8, corners: .allCorners)
                    }
                }
            }
        }
    }

    @ViewBuilder
    func clubListRow(
        clubInfo: SchoolWithClubsEntity
    ) -> some View {
        HStack {
            HStack {
                BitgouelText(
                    text: clubInfo.clubName,
                    font: .text3
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 16)

                Spacer()
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.bitgouel(.greyscale(.g7)))
            }

            Spacer()

            Button {
                editAction(clubInfo)
            } label: {
                BitgouelAsset.Icons.penFill.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.bitgouel(.primary(.p5)))
                    .frame(width: 24, height: 24)
            }
        }
    }
}
