import SwiftUI

struct NoInfoView: View {
    var text: String

    var body: some View {
        VStack {
            BitgouelAsset.Icons.emptyBox.swiftUIImage

            Text(text)
                .bitgouelFont(.text3, color: .greyscale(.g4))
        }
    }
}
