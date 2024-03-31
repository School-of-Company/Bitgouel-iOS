import Service
import SwiftUI

struct ActivityListRow: View {
    let id: String
    let title: String
    let date: String
    let userID: String
    let name: String
    let authority: UserAuthorityType

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                VStack(alignment: .leading) {
                    BitgouelText(
                        text: title,
                        font: .text1
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g0)))

                    BitgouelText(
                        text: date,
                        font: .text3
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g7)))

                    BitgouelText(
                        text: name,
                        font: .text3
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g7)))

                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 16)

                Spacer()
            }
        }
        .frame(height: 156)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g9)), lineWidth: 1)
        }
    }
}
