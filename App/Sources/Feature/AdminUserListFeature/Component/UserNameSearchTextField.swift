import SwiftUI

public struct UserNameSearchTextField: View {
    var onSubmit: () -> Void
    @Binding var text: String

    public init(
        text: Binding<String>,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.onSubmit = onSubmit
    }

    public var body: some View {
            HStack {
                TextField("이름으로 검색...", text: $text)
                    .onSubmit(onSubmit)
                    .bitgouelFont(.text3)
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                
                BitgouelAsset.Icons.magnifyingglass.swiftUIImage
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
