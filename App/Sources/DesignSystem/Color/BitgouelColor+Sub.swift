import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint: disable identifier_name
    enum Sub: BitgouelColorable {
        case s1
        case s2
        case s3
        case s4
        case s5
        case s6
        case s7
        case s8
        case s9
    }
    // swiftlint: enable identifier_name
}

public extension Color.BitgouelColorSystem.Sub {
    var color: Color {
        switch self {
        case .s1: return BitgouelAsset.Sub.s1.swiftUIColor
        case .s2: return BitgouelAsset.Sub.s2.swiftUIColor
        case .s3: return BitgouelAsset.Sub.s3.swiftUIColor
        case .s4: return BitgouelAsset.Sub.s4.swiftUIColor
        case .s5: return BitgouelAsset.Sub.s5.swiftUIColor
        case .s6: return BitgouelAsset.Sub.s6.swiftUIColor
        case .s7: return BitgouelAsset.Sub.s7.swiftUIColor
        case .s8: return BitgouelAsset.Sub.s8.swiftUIColor
        case .s9: return BitgouelAsset.Sub.s9.swiftUIColor
        }
    }
}
