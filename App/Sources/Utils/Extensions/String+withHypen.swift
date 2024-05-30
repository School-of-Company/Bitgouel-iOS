import Foundation

public extension String {
    var withHypen: String {
        var stringWithHypen: String = self

        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.startIndex, offsetBy: 3))
        stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.endIndex, offsetBy: -4))

        return stringWithHypen
    }
}
