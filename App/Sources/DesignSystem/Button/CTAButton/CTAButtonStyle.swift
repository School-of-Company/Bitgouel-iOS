import SwiftUI

public extension CTAButton {
    enum CTAStyle {
        case `default`
        case error
        case cancel
    }
}

public struct CTAButtonStyle: ButtonStyle {
    var style: CTAButton.CTAStyle

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .`default`:
            DefaultButton(configuration: configuration)

        case .error:
            ErrorButton(configuration: configuration)

        case .cancel:
            CancelButton(configuration: configuration)
        }
    }
}

extension CTAButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration

        var body: some View {
            configuration.label
                .bitgouelFont(.text3, color: .greyscale(.g10))
                .background(Color.bitgouel(.primary(.p5)))
                .cornerRadius(8, corners: .bottomRight)
        }
    }
}

extension CTAButtonStyle {
    struct ErrorButton: View {
        let configuration: ButtonStyle.Configuration

        var body: some View {
            configuration.label
                .bitgouelFont(.text3, color: .greyscale(.g10))
                .background(Color.bitgouel(.error(.e5)))
                .cornerRadius(8, corners: .bottomRight)
        }
    }
}

extension CTAButtonStyle {
    struct CancelButton: View {
        let configuration: ButtonStyle.Configuration

        var body: some View {
            configuration.label
                .bitgouelFont(.text3, color: .greyscale(.g10))
                .background(Color.bitgouel(.greyscale(.g4)))
                .cornerRadius(8, corners: .bottomLeft)
        }
    }
}
