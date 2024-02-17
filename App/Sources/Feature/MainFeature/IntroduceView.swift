import SwiftUI

struct IntroduceView: View {
    var introduceTitle: String
    var introduceText: String

    var body: some View {
        HStack {
            Text(introduceTitle)
                .bitgouelFont(.title2)

            Spacer()
        }

        HStack {
            Text(introduceText)
                .bitgouelFont(.caption, color: .greyscale(.g7))

            Spacer()
        }
        .padding(.bottom, 16)
    }
}
