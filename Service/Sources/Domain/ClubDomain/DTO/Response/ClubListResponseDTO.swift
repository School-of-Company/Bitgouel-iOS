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

extension ClubListResponseDTO.Club {
    func toDomain() -> SingleClubEntity {
        SingleClubEntity(
            id: id,
            name: name
        )
    }
}

extension ClubListResponseDTO {
    func toDomain() -> ClubsEntity {
        ClubsEntity(
            clubs: clubs.map{ $0.toDomain() }
        )
    }
}
