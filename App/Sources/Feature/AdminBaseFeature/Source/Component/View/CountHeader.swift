import SwiftUI

public struct CountHeader: View {
    let count: Int
    let epic: String

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("총 \(count)개 \(epic)")
                .bitgouelFont(.caption, color: .greyscale(.g4))
                .padding(.top, 24)

            Divider()
        }
    }
}
