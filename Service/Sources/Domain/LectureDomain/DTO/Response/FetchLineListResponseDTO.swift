import Foundation

public struct FetchLineListResponseDTO: Decodable {
    public let lines: [String]

    public init(lines: [String]) {
        self.lines = lines
    }
}
