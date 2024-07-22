import SwiftUI

public enum deactivateType {
    case minus
    case cancel
}

public struct DeactivateButton: View {
    let text: String
    let buttonType: deactivateType
    let action: () -> Void

    public var body: some View {
        HStack {
            Spacer()

            HStack(spacing: 8) {
                ButtonIcon()
                    .renderingMode(.template)

                BitgouelText(
                    text: text,
                    font: .text2
                )
            }
            .padding(.vertical, 12)

            Spacer()
        }
        .foregroundColor(.white)
        .background(Color.bitgouel(.error(.e5)))
        .cornerRadius(8, corners: .allCorners)
        .buttonWrapper(action)
    }

    func ButtonIcon() -> Image {
        switch buttonType {
        case .minus:
            BitgouelAsset.Icons.minusFill.swiftUIImage

        case .cancel:
            BitgouelAsset.Icons.cancelFill.swiftUIImage
        }
    }
}
