import SwiftUI

public extension AssociationSelectButton {
    enum SelectButtonStyleType {
        case select
    }
}

public struct AssociationSelectButtonStyle: ButtonStyle {
    var style: AssociationSelectButton.SelectButtonStyleType

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .select:
            SelectButton(configuration: configuration)
        }
    }
}

private extension AssociationSelectButtonStyle {
    struct SelectButton: View {
        let configuration: ButtonStyle.Configuration
        var foregroundColor: Color {
            configuration.isPressed ? .black : .bitgouel(.greyscale(.g4))
        }

        var backgroundColor: Color {
            .white
        }

        var strokeColor: Color {
            configuration.isPressed ? .bitgouel(.primary(.p5)) : .bitgouel(.greyscale(.g7))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text2)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(strokeColor, lineWidth: 1)
                }
        }
    }
}
