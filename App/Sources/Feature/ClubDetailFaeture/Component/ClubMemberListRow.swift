import SwiftUI
import Service

struct ClubMemberListRow: View {
    let id: String
    let name: String
    let autority: UserAuthorityType

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                BitgouelText(
                    text: name,
                    font: .caption
                )

                Spacer()

                if autority == .teacher {
                    BitgouelText(
                        text: "담당 선생님",
                        font: .caption
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                } else if autority == .student {
                    BitgouelText(
                        text: "학생",
                        font: .caption
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                }
            }

            Divider()
                .padding(.top, 20)
        }
    }
}
