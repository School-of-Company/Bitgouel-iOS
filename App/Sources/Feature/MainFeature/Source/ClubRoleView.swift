import SwiftUI

struct ClubRoleView: View {
    var clubRole: String
    var clubRoleDetail: String
    var clubRoleText: String

    var body: some View {
        VStack {
            HStack {
                Text(clubRole)
                    .bitgouelFont(.text1)

                Spacer()
            }

            HStack {
                Text(clubRoleDetail)
                    .bitgouelFont(.text2, color: .greyscale(.g4))

                Spacer()
            }
            .padding(.bottom, 16)

            HStack {
                Text(clubRoleText)
                    .bitgouelFont(.caption, color: .greyscale(.g7))

                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
    }
}
