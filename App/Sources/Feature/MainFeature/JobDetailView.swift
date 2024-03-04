import SwiftUI

struct JobDetailView: View {
    var jobDetailTitle: String
    var jobDetailText: String

    var body: some View {
        VStack {
            HStack {
                Text(jobDetailTitle)
                    .bitgouelFont(.title3)
                    .padding(.bottom, 8)

                Spacer()
            }

            HStack {
                Text(jobDetailText)
                    .bitgouelFont(.text2, color: .greyscale(.g4))

                Spacer()
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
    }
}
