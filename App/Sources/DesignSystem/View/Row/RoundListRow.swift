import Service
import SwiftUI

struct RoundListRow: View {
    let id: String
    let title: String
    let date: String
    let userID: String
    let name: String
    let state: ApproveStatusType
    let authority: UserAuthorityType

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                VStack(alignment: .leading) {
                    BitgouelText(
                        text: title,
                        font: .title3
                    )

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
            .overlay(alignment: .bottomTrailing) {
                if authority != .student {
                    Text(state.display())
                        .bitgouelFont(.caption, color: .greyscale(.g10))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background {
                            if state == .approve {
                                Color.bitgouel(.primary(.p5))
                            } else {
                                Color.bitgouel(.error(.e5))
                            }
                        }
                        .cornerRadius(18)
                        .padding(.trailing, 16)
                        .padding(.bottom, 16)
                }
            }
        }
        .frame(height: 156)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g9)), lineWidth: 1)
        }
    }
}

