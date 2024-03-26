import SwiftUI

struct IntroduceView: View {
    var introduceTitle: String
    var introduceText: String

    var body: some View {
        VStack(spacing: 0) {
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
        }
    }
}
