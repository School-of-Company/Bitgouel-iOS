import SwiftUI

public struct BitgoeulButton: View {
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
        return if isEnabled == false {
            Color.bitgouel(.greyscale(.g4))
        } else if buttonState == true {
            Color.bitgouel(.greyscale(.g7))
        } else {
            Color.white
        }
    }
    
    private var inputBackgroundColor: Color {
        return if isEnabled == false {
            Color.bitgouel(.greyscale(.g6))
        } else if buttonState == true {
            Color.bitgouel(.primary(.p4))
        } else {
            Color.bitgouel(.primary(.p5))
        }
    }
    
    public var body: some View {
        Button {
            self.buttonState = true
        } label: {
            Text(text)
        }
        .bitgouelFont(.text1)
        .padding(.horizontal, 32)
        .padding(.vertical, 13.5)
        .foregroundColor(inputForegroundColor)
        .background(inputBackgroundColor)
        .cornerRadius(8)
        .disabled(isEnabled ? false : true)
    }
}
