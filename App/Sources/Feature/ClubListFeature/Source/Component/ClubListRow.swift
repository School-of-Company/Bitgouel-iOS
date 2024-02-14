import SwiftUI

struct ClubListRow: View {
    let clubName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                BitgouelText(
                    text: clubName,
                    font: .text1
                )

                HStack(spacing: 6) {
                    BitgouelText(
                        text: "내부 인원 보기",
                        font: .caption
                    )

                    BitgouelAsset.Icons.chevronRight.swiftUIImage
                        .frame(width: 8, height: 12)
                }
                .foregroundColor(.bitgouel(.greyscale(.g7)))

                Divider()
            }
            .padding(.vertical, 8)

            Spacer()
        }
    }
}
