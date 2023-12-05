import SwiftUI

public extension Color.BitgouelColorSystem {
    enum Greyscale: BitgouelColorable {
        case g0
        case g1
        case g2
        case g3
        case g4
        case g5
        case g6
        case g7
        case g8
        case g9
        case g10
    }
}

public extension Color.BitgouelColorSystem.Greyscale {
    var color: Color {
        switch self {
        case .g0: return BitgouelAsset.Greyscale.g0.swiftUIColor
        case .g1: return BitgouelAsset.Greyscale.g1.swiftUIColor
        case .g2: return BitgouelAsset.Greyscale.g2.swiftUIColor
        case .g3: return BitgouelAsset.Greyscale.g3.swiftUIColor
        case .g4: return BitgouelAsset.Greyscale.g4.swiftUIColor
        case .g5: return BitgouelAsset.Greyscale.g5.swiftUIColor
        case .g6: return BitgouelAsset.Greyscale.g6.swiftUIColor
        case .g7: return BitgouelAsset.Greyscale.g7.swiftUIColor
        case .g8: return BitgouelAsset.Greyscale.g8.swiftUIColor
        case .g9: return BitgouelAsset.Greyscale.g9.swiftUIColor
        case .g10: return BitgouelAsset.Greyscale.g10.swiftUIColor
        }
    }
}
