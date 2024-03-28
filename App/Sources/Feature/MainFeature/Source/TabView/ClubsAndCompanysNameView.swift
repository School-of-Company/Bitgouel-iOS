import SwiftUI

struct ClubsAndCompanysNameView: View {
    var name: String

    var body: some View {
        Text(name)
            .bitgouelFont(.text3, color: .primary(.p9))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 999)
                    .stroke(.white, lineWidth: 1)
            }
            .padding(.top, 16)
    }
}
