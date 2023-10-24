import SwiftUI

public extension Color {
    enum BitgouelColorSystem {
        case primary(Primary)
        case sub(Sub)
        case error(Error)
        case greyscale(Greyscale)
    }

    static func bitgouel(_ style: BitgouelColorSystem) -> Color {
        switch style {
        case let .primary(colorable as BitgouelColorable),
             let .sub(colorable as BitgouelColorable),
             let .error(colorable as BitgouelColorable),
             let .greyscale(colorable as BitgouelColorable):
            return colorable.color
        }
    }
}
