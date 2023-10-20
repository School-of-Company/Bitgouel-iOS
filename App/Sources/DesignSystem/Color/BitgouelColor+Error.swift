import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint:disable identifier_name
    enum Error: BitgouelColorable {
        case e1
        case e2
        case e3
        case e4
        case e5
        case e6
        case e7
        case e8
        case e9
    }
}

public extension Color.BitgouelColorSystem.Error {
    var color: Color {
        switch self {
        case .e1: return BitgouelAsset.Error.e1.swiftUIColor
        case .e2: return BitgouelAsset.Error.e2.swiftUIColor
        case .e3: return BitgouelAsset.Error.e3.swiftUIColor
        case .e4: return BitgouelAsset.Error.e4.swiftUIColor
        case .e5: return BitgouelAsset.Error.e5.swiftUIColor
        case .e6: return BitgouelAsset.Error.e6.swiftUIColor
        case .e7: return BitgouelAsset.Error.e7.swiftUIColor
        case .e8: return BitgouelAsset.Error.e8.swiftUIColor
        case .e9: return BitgouelAsset.Error.e9.swiftUIColor
        }
    }
}
