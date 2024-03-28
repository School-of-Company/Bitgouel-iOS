import Foundation

public struct BitgouelAlertButtonType: Identifiable {
    public let id: String = UUID().uuidString
    let text: String
    let style: CTAButton.CTAStyle
    let action: () -> Void

    public init(
        text: String = "",
        style: CTAButton.CTAStyle = .default,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }
}
