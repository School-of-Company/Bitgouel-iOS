import Foundation

public struct ClubListResponseDTO: Decodable {
    public let clubs: [Club]
}

public extension ClubListResponseDTO {
    struct Club: Decodable {
        public let id: String
        public let name: String
    }
}
