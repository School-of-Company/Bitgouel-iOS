import SwiftUI

struct KeywordSearchBar: View {
    @Binding var text: String
    let prompt: String
    let filterAction: () -> Void

    var body: some View {
        HStack(spacing: 11) {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g7)), lineWidth: 1)
                .frame(height: 54)
                .overlay {
                    HStack {
                        TextField(prompt, text: $text)

                        Spacer()

                        BitgouelAsset.Icons.search.swiftUIImage
                    }
                    .padding(.horizontal, 20)
                }

            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g2)), lineWidth: 1)
                .frame(width: 44, height: 54)
                .overlay {
                    Button {
                        filterAction()
                    } label: {
                        BitgouelAsset.Icons.filter.swiftUIImage
                    }
                }
        }
    }
}
