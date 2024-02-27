import SwiftUI

struct CertificationListRow: View {
    let id: String
    let title: String
    let acquisitionDate: Date
    let editAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()

            HStack {
                BitgouelText(
                    text: title,
                    font: .text1
                )

                Spacer()
                
                Button {
                    editAction()
                } label: {
                    BitgouelText(
                        text: "수정",
                        font: .text3
                    )
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                        , alignment: .bottom
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
            }

            BitgouelText(
                text: acquisitionDate.toStringCustomFormat(format: "yyyy.M.dd"),
                font: .caption
            )
            .foregroundColor(.bitgouel(.greyscale(.g7)))

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
