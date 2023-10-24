import SwiftUI

struct BitgouelText: View {
    var text: String
    var font: Font.BitgouelFontSystem

    public init(text: String, font: Font.BitgouelFontSystem = .text1) {
        self.text = text
        self.font = font
    }

    public var body: some View {
        Text(text)
            .bitgouelFont(font)
    }
}
