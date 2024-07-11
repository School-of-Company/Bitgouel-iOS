import SwiftUI

public struct DeactivateButton: View {
    let text: String
    let action: () -> Void

    public init(
        text: String,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.action = action
    }

    public var body: some View {
        HStack(spacing: 10) {
            BitgouelAsset.Icons.minusFill.swiftUIImage
                .renderingMode(.template)

            BitgouelText(
                text: text,
                font: .text2
            )
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
        .padding(.horizontal, 68)
        .background(Color.bitgouel(.error(.e5)))
        .cornerRadius(8, corners: .allCorners)
        .buttonWrapper(action)
    }
}
