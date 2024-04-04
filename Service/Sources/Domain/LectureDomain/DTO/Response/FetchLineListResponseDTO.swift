import Foundation

public struct FetchDivisionListResponseDTO: Decodable {
    public let lines: [String]

    public init(lines: [String]) {
        self.lines = lines
    }
}
