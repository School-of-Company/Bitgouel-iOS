import SwiftUI

public struct RejectionButton: View {
    var action: () -> Void

    public init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            BitgouelAsset.Icons.cancelFill.swiftUIImage
                .renderingMode(.template)
            
            BitgouelText(
                text: "거절",
                font: .text2
            )
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
        .padding(.horizontal, 48)
        .background(Color.bitgouel(.error(.e5)))
        .cornerRadius(8, corners: .allCorners)
        .buttonWrapper {
            action()
        }
    }
}
