import SwiftUI

public enum ActivateType {
    case check
    case add
    case pen
}

public struct ActivateButton: View {
    let text: String
    let buttonType: ActivateType
    let action: () -> Void

    public var body: some View {
        HStack {
            Spacer()

            HStack(spacing: 8) {
                buttonIcon()
                    .renderingMode(.template)
                
                BitgouelText(
                    text: text,
                    font: .text2
                )
            }

            Spacer()
        }
        .foregroundColor(.white)
        .padding(.vertical, 12)
        .background(Color.bitgouel(.primary(.p5)))
        .cornerRadius(8, corners: .allCorners)
        .buttonWrapper {
            action()
        }
    }

    func buttonIcon() -> Image {
        switch buttonType {
        case .check:
            return BitgouelAsset.Icons.checkFill.swiftUIImage

        case .add:
            return BitgouelAsset.Icons.addFill.swiftUIImage

        case .pen:
            return BitgouelAsset.Icons.penFill.swiftUIImage
        }
    }
}
