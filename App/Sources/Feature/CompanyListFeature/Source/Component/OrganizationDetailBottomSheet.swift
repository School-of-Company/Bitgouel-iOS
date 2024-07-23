import SwiftUI

public struct OrganizationDetailBottomSheet: View {
    let epic: String
    let name: String
    let detailInfo: String
    let cancel: (Bool) -> Void
    let deleteAction: () -> Void

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                BitgouelText(
                    text: "\(epic) 상세",
                    font: .title3
                )

                Spacer()

                Button {
                    cancel(false)
                } label: {
                    BitgouelAsset.Icons.cancel.swiftUIImage
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                BitgouelText(
                    text: name,
                    font: .text1
                )

                BitgouelText(
                    text: detailInfo,
                    font: .caption
                )
                .foregroundColor(Color.bitgouel(.greyscale(.g4)))
            }
            .padding(.vertical, 8)

            Spacer()
        }
        .overlay(alignment: .bottom) {
            DeactivateButton(
                text: "기관 삭제",
                buttonType: .minus) {
                    deleteAction()
                }
        }
        .padding(.horizontal, 28)
        .frame(height: 500)
    }
}
