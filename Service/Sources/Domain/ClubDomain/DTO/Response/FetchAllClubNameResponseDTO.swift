import Foundation

public struct FetchAllClubNameResponseDTO: Decodable {
    public let clubs: [ClubNameResponseDTO]

    public init(clubs: [ClubNameResponseDTO]) {
        self.clubs = clubs
    }

    public struct ClubNameResponseDTO: Decodable {
        public let name: String
    }
}

extension FetchAllClubNameResponseDTO {
    func toDomain() -> [String] {
        clubs.map(\.name)
    }
}
