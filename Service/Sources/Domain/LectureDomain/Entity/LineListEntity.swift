import Foundation

public struct LineListEntity: Equatable {
    public let lines: [String]

    public init(lines: [String]) {
        self.lines = lines
    }
}
