import SwiftUI

public extension BitgouelButton {
    enum ButtonStyleType {
        case primary
        case secondary
        case error
        case cancel
    }
}

public struct BitgouelButtonStyle: ButtonStyle {
    var style: BitgouelButton.ButtonStyleType

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .primary:
            PrimaryButton(configuration: configuration)

        case .secondary:
            SecondaryButton(configuration: configuration)

        case .error:
            ErrorButton(configuration: configuration)

        case .cancel:
            CancelButton(configuration: configuration)
        }
    }
}

private extension BitgouelButtonStyle {
    struct PrimaryButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? enabledForegroundColor : .bitgouel(.greyscale(.g4))
        }

        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .bitgouel(.greyscale(.g7))
        }

        var enabledForegroundColor: Color {
            configuration.isPressed ? .bitgouel(.greyscale(.g7)) : .white
        }

        var enabledBackgroundColor: Color {
            configuration.isPressed ? .bitgouel(.primary(.p4)) : .bitgouel(.primary(.p5))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
        }
    }
}

private extension BitgouelButtonStyle {
    struct SecondaryButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? enabledForegroundColor : .bitgouel(.greyscale(.g4))
        }

        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .white
        }

        var enabledForegroundColor: Color {
            configuration.isPressed ? .bitgouel(.primary(.p4)) : .bitgouel(.primary(.p5))
        }

        var enabledBackgroundColor: Color {
            configuration.isPressed ? .bitgouel(.greyscale(.g7)) : .white
        }

        var strokeColor: Color {
            isEnabled ? enableStrokeForegroundColor : .bitgouel(.greyscale(.g7))
        }

        var enableStrokeForegroundColor: Color {
            configuration.isPressed ? .bitgouel(.primary(.p4)) : .bitgouel(.primary(.p5))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(strokeColor, lineWidth: 1)
                }
        }
    }
}

private extension BitgouelButtonStyle {
    struct ErrorButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? enabledForegroundColor : .bitgouel(.greyscale(.g4))
        }

        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .bitgouel(.greyscale(.g7))
        }

        var enabledForegroundColor: Color {
            configuration.isPressed ? .bitgouel(.greyscale(.g7)) : .white
        }

        var enabledBackgroundColor: Color {
            configuration.isPressed ? .bitgouel(.greyscale(.g7)) : .bitgouel(.error(.e5))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
        }
    }
}

private extension BitgouelButtonStyle {
    struct CancelButton: View {
        let configuration: ButtonStyle.Configuration
        var foregroundColor: Color {
            .bitgouel(.error(.e5))
        }

        var backgroundColor: Color {
            .white
        }

        var strokeColor: Color {
            .bitgouel(.error(.e5))
        }

        var body: some View {
            configuration.label
                .bitgouelFont(.text1)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(strokeColor, lineWidth: 1)
                }
        }
    }
}
