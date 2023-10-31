import SwiftUI

public extension View {
    func buttonWrapper(_ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self
        }
    }
}

public struct BitgouelButton: View {
    var text: String
    var style: BitgouelStyle
    var action: () -> Void
    
    public init(
        text: String,
        style: BitgouelStyle = .primary,
        action: @escaping () -> Void = {}
        
    ) {
        self.text = text
        self.style = .primary
        self.action = action
    }
    
    public var body: some View {
        HStack {
            Spacer()
            
            Text(text)
                .padding(.vertical, 13.5)
            
            Spacer()
        }
        .buttonWrapper(action)
        .buttonStyle(BitgouelButtonStyle(style: style))
    }
}

