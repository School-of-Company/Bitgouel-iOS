import SwiftUI

struct PickerTextField: View {
    var placeholder: String
    var text: String
    var action: () -> Void

    init(
        _ placeholder: String,
        text: String,
        action: @escaping () -> Void
    ) {
        self.placeholder = placeholder
        self.text = text
        self.action = action
    }

    var body: some View {
        HStack {
            Text(text)
                .bitgouelFont(.text3)

            Spacer()

            BitgouelAsset.Icons.chevronDown.swiftUIImage
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Color.bitgouel(.greyscale(.g9)))
        .cornerRadius(8)
        .overlay {
            if text.isEmpty {
                HStack {
                    Text(placeholder)
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                        .padding(.leading, 20)

                    Spacer()
                }
            }
        }
        .buttonWrapper(action)
    }
}
