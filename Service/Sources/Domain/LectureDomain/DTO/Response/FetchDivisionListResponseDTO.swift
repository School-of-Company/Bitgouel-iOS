import Foundation

public struct FetchDivisionListResponseDTO: Decodable {
    public let divisions: [String]

    public init(divisions: [String]) {
        self.divisions = divisions
    }
}
