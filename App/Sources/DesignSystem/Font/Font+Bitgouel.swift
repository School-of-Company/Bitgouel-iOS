import SwiftUI

public extension View {
    func bitgouelFont(
        _ style: Font.BitgouelFontSystem,
        color: Color.BitgouelColorSystem
    ) -> some View {
        self
            .font(.bitgouel(style))
            .foregroundColor(.bitgouel(color))
    }
    
    func bitgouelFont(
        _ style: Font.BitgouelFontSystem
    ) -> some View {
        self
            .font(.bitgouel(style))
    }
}

public extension Font {
    enum BitgouelFontSystem: BitgouelFontable {
        case title1
        case title2
        case title3
        case text1
        case text2
        case text3
        case caption
    }
    
    static func bitgouel(_ style: BitgouelFontSystem) -> Font {
        return style.font
    }
}

public extension Font.BitgouelFontSystem {
    var font: Font {
        switch self {
        case .title1:
            return Font(BitgouelFontFamily.Pretendard.semiBold.font(size: 30))
            
        case .title2:
            return Font(BitgouelFontFamily.Pretendard.semiBold.font(size: 26))
            
        case .title3:
            return Font(BitgouelFontFamily.Pretendard.semiBold.font(size: 20))
            
        case .text1:
            return Font(BitgouelFontFamily.Pretendard.semiBold.font(size: 18))
            
        case .text2:
            return Font(BitgouelFontFamily.Pretendard.regular.font(size: 18))
            
        case .text3:
            return Font(BitgouelFontFamily.Pretendard.regular.font(size: 16))
            
        case .caption:
            return Font(BitgouelFontFamily.Pretendard.regular.font(size: 14))
        }
    }
}
