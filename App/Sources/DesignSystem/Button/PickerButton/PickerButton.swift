import SwiftUI

public struct PickerButton: View {
    var text: String
    var image: String
    var style: BitgouelPickerStyleType
    var action: () -> Void

    public init(
        text: String,
        image: String,
        style: BitgouelPickerStyleType = .picked,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.image = image
        self.style = style
        self.action = action
    }

    public var body: some View {
        HStack {
            Text(text)

            Spacer()

            Image(image)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .buttonWrapper(action)
        .buttonStyle(BitgouelPickerStyle(style: style))
    }
}
