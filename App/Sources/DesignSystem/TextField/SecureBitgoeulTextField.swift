
import SwiftUI

public struct SecureBitgouelTextField: View {
    var placeholder: String
    var helpMessage: String
    var link: String
    var isError: Bool
    var isEmpty: Bool { text.isEmpty }
    @State var isSecure = true
    var onSubmit: () -> Void
    var onLink: () -> Void
    @Binding var text: String
    @FocusState var isFocused: Bool
    @Environment(\.isEnabled) var isEnabled

    private var borderForegroundColor: Color {
        if isFocused {
            return Color.bitgouel(.primary(.p5))
        } else if isError {
            return Color.bitgouel(.error(.e5))
        } else {
            return Color.bitgouel(.greyscale(.g7))
        }
    }

    private var inputForegroundColor: Color {
        if isError {
            return Color.bitgouel(.error(.e5))
        } else if isFocused || isEmpty {
            return Color.black
        } else {
            return Color.bitgouel(.greyscale(.g7))
        }
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        helpMessage: String = "",
        link: String = "",
        isError: Bool = false,
        isEmpty: Bool = false,
        onSubmit: @escaping () -> Void = {},
        onLink: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        self._text = text
        self.helpMessage = helpMessage
        self.link = link
        self.isError = isError
        self.onSubmit = onSubmit
        self.onLink = onLink
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .onSubmit(onSubmit)
                .focused($isFocused)
                .bitgouelFont(.text3)
                .foregroundColor(inputForegroundColor)
                .background(isEnabled ? Color.white : Color.bitgouel(.greyscale(.g7)))
                .disabled(isEnabled ? false : true)

                Button {
                    isSecure.toggle()
                } label: {
                    isSecure ?
                        BitgouelAsset.Icons.eye.swiftUIImage :
                        BitgouelAsset.Icons.eyeSlash.swiftUIImage
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

            HStack {
                Text(helpMessage)
                    .bitgouelFont(.caption, color: isError ? .error(.e5) : .greyscale(.g4))
                    .padding(.leading, 4)
                
                Spacer()
                    
                Text(link)
                    .bitgouelFont(.caption, color: isEnabled ? .primary(.p5) : .greyscale(.g4))
                    .padding(.trailing, 4)
            }
            .padding(.top, 4)
        }
    }
}
