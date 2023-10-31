import SwiftUI

public struct BitgouelButton: View {
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
            return Color.bitgouel(.primary(.p4))
        } else {
            return Color.bitgouel(.primary(.p5))
        }
    }
    
    private var inputBackgroundColor: Color {
        if isEnabled == false {
            return Color.white
        } else if buttonState == true {
            return Color.bitgouel(.greyscale(.g9))
        } else {
            return Color.white
        }
    }
    
    private var borderForegroundColor: Color {
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
            self.buttonState.toggle()
        } label: {
            Spacer()
            
            Text(text)
            
            Spacer()
        }
        .padding(.vertical, 13.5)
        .foregroundColor(inputForegroundColor)
        .background(inputBackgroundColor)
        .cornerRadius(8)
        .disabled(isEnabled ? false : true)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(borderForegroundColor)
        }
    }
}
