import SwiftUI

struct PostListRow: View {
    public let postId: String
    public let title: String
    public let modifedAt: String

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            HStack {
                BitgouelText(
                    text: title,
                    font: .text1
                )

                Spacer()

                BitgouelAsset.Icons.verticalEllipsisFill.swiftUIImage
            }

            HStack(spacing: 0) {
                BitgouelText(
                    text: modifedAt,
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
