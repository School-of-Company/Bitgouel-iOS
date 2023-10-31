import SwiftUI

public struct BitgouelPrimaryButton: View {
    @State public var buttonState: Bool
    @Environment(\.isEnabled) var isEnabled
    var text: String

    public init (
        text: String = "",
        buttonState: Bool = false
    ) {
        self.text = text
        self.buttonState = buttonState
    }

    private var inputForegroundColor: Color {
        if isEnabled == false {
            return Color.bitgouel(.greyscale(.g4))
        } else if buttonState == true {
            return Color.bitgouel(.greyscale(.g7))
        } else {
            return Color.white
        }
    }

    private var inputBackgroundColor: Color {
        if isEnabled == false {
            return Color.bitgouel(.greyscale(.g6))
        } else if buttonState == true {
            return Color.bitgouel(.primary(.p4))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }

    public var body: some View {
        Button {
            self.buttonState = true
        } label: {
            Spacer()

            Text(text)

            Spacer()
        }
        .bitgouelFont(.text1)
        .padding(.vertical, 13.5)
        .foregroundColor(inputForegroundColor)
        .background(inputBackgroundColor)
        .cornerRadius(8)
        .disabled(isEnabled ? false : true)
    }
}
