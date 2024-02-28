import SwiftUI

struct ListRow: View {
    let id: String
    let title: String
    let modifiedAt: Date

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            HStack {
                BitgouelText(
                    text: title,
                    font: .text1
                )

                Spacer()
            }

            HStack(spacing: 0) {
                BitgouelText(
                    text: modifiedAt.toStringCustomFormat(format: "yyyy.M.dd"),
                    font: .caption
                )

                BitgouelText(
                    text: "에 게시",
                    font: .caption
                )

                Spacer()
            }
            .foregroundColor(.bitgouel(.greyscale(.g7)))

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
