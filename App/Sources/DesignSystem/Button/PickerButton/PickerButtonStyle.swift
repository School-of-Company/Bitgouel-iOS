import SwiftUI

public extension PickerButton {
    enum BitgouelPickerStyleType {
        case picked
    }
}

public struct BitgouelPickerStyle: ButtonStyle {
    var style: PickerButton.BitgouelPickerStyleType

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .picked:
            SelectedPicker(configuration: configuration)
        }
    }
}

private extension BitgouelPickerStyle {
    struct SelectedPicker: View {
        let configuration: ButtonStyle.Configuration
        var foregroundColor: Color {
            configuration.isPressed ? .white : .bitgouel(.greyscale(.g4))
        }

        var backgroundColor: Color {
            configuration.isPressed ? .bitgouel(.primary(.p5)) : .bitgouel(.greyscale(.g9))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text3)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}
