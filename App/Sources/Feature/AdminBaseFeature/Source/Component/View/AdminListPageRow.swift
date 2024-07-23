import SwiftUI

public struct AdminListPageRow: View {
    let name: String
    let detailInfo: String

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .bitgouelFont(.text1, color: .greyscale(.g0))

            Text(detailInfo)
                .bitgouelFont(.caption, color: .greyscale(.g4))
        }
    }
}
