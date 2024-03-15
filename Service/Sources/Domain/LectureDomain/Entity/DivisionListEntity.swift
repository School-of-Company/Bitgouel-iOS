import Foundation

public struct DivisionListEntity: Equatable {
    public let lines: [String]
    
    public init(lines: [String]) {
        self.lines = lines
    }
}
