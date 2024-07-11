import SwiftUI

public struct AcceptButton: View {
    var action: () -> Void

    public init(action: @escaping () -> Void = {}) {
        self.action = action
    }

    public var body: some View {
        HStack(spacing: 8) {
            BitgouelAsset.Icons.checkFill.swiftUIImage
                .renderingMode(.template)
            
            BitgouelText(
                text: "수락",
                font: .text2
            )
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
        .padding(.horizontal, 48)
        .background(Color.bitgouel(.primary(.p5)))
        .cornerRadius(8, corners: .allCorners)
        .buttonWrapper {
            action()
        }
    }
}
