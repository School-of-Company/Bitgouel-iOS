
import SwiftUI

public struct BitgouelTextField: View {
    var placeholder: String
    var helpMessage: String
    var isError: Bool
    var isEmpty: Bool { text.isEmpty }
    var onSubmit: () -> Void
    @Binding var text: String
    @FocusState var isFocused: Bool
    @Environment(\.isEnabled) var isEnabled
    
    private var borderForegroundColor: Color {
        return if isFocused {
            Color.bitgouel(.primary(.p5))
        } else if isError {
            Color.bitgouel(.error(.e5))
        } else {
            Color.bitgouel(.greyscale(.g7))
        }
    }
    
    private var inputForegroundColor: Color {
        return if isError {
            Color.bitgouel(.error(.e5))
        } else if isFocused || isEmpty {
            Color.black
        } else {
            Color.bitgouel(.greyscale(.g7))
        }
    }
    
    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        helpMessage: String = "",
        isError: Bool = false,
        isEmpty: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        self._text = text
        self.helpMessage = helpMessage
        self.isError = isError
        self.onSubmit = onSubmit
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                TextField(placeholder, text: $text)
                    .onSubmit(onSubmit)
                    .focused($isFocused)
                    .bitgouelFont(.text3)
                    .foregroundColor(inputForegroundColor)
                    .background(isEnabled ? Color.white : Color.bitgouel(.greyscale(.g7)))
                    .disabled(!isEnabled)
                Button {
                    text = ""
                } label: {
                    BitgouelAsset.Assets.cancel.swiftUIImage
                }
            }
            .frame(height: 54)
            .padding(.horizontal, 20)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(borderForegroundColor)
            }
            .onTapGesture {
                isFocused = true
            }
            
            Text(helpMessage)
                .bitgouelFont(.text3, color: isError ? .error(.e5) : .greyscale(.g4))
        }
    }
}
