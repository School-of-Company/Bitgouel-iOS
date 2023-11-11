import SwiftUI

public struct PressedSelectionButtonStyle: ButtonStyle {
    var isSelected: Bool

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        Circle()
            .fill(self.isSelected && configuration.isPressed ? Color.bitgouel(.primary(.p5)) : Color.clear)
            .overlay {
                configuration.label
            }
            .frame(width: 24, height: 24)
    }
}
