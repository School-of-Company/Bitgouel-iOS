import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint:disable identifier_name
    enum Primary: BitgouelColorable {
        case P1
        case P2
        case P3
        case P4
        case P5
        case P6
        case P7
        case P8
        case P9
    }
}

public extension Color.BitgouelColorSystem.Primary {
    var color: Color {
        switch self {
        case .P1: return BitgouelAsset.Primary.p1.swiftUIColor
        case .P2: return BitgouelAsset.Primary.p2.swiftUIColor
        case .P3: return BitgouelAsset.Primary.p3.swiftUIColor
        case .P4: return BitgouelAsset.Primary.p4.swiftUIColor
        case .P5: return BitgouelAsset.Primary.p5.swiftUIColor
        case .P6: return BitgouelAsset.Primary.p6.swiftUIColor
        case .P7: return BitgouelAsset.Primary.p7.swiftUIColor
        case .P8: return BitgouelAsset.Primary.p8.swiftUIColor
        case .P9: return BitgouelAsset.Primary.p9.swiftUIColor
        }
    }
}
