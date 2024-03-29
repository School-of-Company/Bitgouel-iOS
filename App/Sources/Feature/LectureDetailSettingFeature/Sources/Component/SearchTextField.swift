import SwiftUI

public struct SearchTextField: View {
    var onSubmit: () -> Void
    @Binding var text: String
    var placeHolder: String
    
    public init(
        text: Binding<String>,
        onSubmit: @escaping () -> Void = {},
        _ placeHolder: String = ""
    ) {
        self._text = text
        self.onSubmit = onSubmit
        self.placeHolder = placeHolder
    }

    public var body: some View {
        HStack {
            TextField(placeHolder , text: $text)
                .onSubmit(onSubmit)
                .bitgouelFont(.text3)
                .foregroundColor(.bitgouel(.greyscale(.g0)))

            BitgouelAsset.Icons.cancel.swiftUIImage
        }
        .frame(height: 54)
        .padding(.horizontal, 20)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.bitgouel(.greyscale(.g7)))
        }
    }
}
