import SwiftUI

struct NoInfoView: View {
    var body: some View {
        VStack {
            BitgouelAsset.Icons.emptyBox.swiftUIImage

            Text("검색 결과가 없습니다")
                .bitgouelFont(.text3, color: .greyscale(.g4))
        }
    }
}
