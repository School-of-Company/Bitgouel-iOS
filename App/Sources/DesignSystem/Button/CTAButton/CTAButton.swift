import SwiftUI

public struct CTAButton: View {
    var text: String
    var style: CTAStyle
    var action: () -> Void

    public init(
        text: String = "",
        style: CTAStyle = .default,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        HStack {
            Spacer()

            Text(text)
                .padding(.vertical, 15)

            Spacer()
        }
        .buttonWrapper {
            action()
        }
        .buttonStyle(CTAButtonStyle(style: style))
    }
}
