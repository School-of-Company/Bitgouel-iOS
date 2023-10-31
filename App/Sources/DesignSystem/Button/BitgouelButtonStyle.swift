import SwiftUI

public extension BitgouelButton {
    enum BitgouelStyle {
        case primary
        case secondary
    }
}

public struct BitgouelButtonStyle: ButtonStyle {
    var style: BitgouelButton.BitgouelStyle
    
    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .primary:
            PrimaryButton(configuration: configuration)
            
        case .secondary:
            SecondaryButton(configuration: configuration)
        }
    }
}

extension BitgouelButtonStyle {
    struct PrimaryButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? enabledForegroundColor : .bitgouel(.greyscale(.g4))
        }
        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .bitgouel(.greyscale(.g6))
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

extension BitgouelButtonStyle {
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
            isEnabled ? enableStrokeForegroundColor : .bitgouel(.greyscale(.g6))
        }
        var enableStrokeForegroundColor: Color {
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
