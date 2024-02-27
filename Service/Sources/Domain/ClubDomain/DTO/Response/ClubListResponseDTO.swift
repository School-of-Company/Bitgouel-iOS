import Foundation

public struct ClubListResponseDTO: Decodable {
    public let clubs: [Club]

    init(clubs: [Club]) {
        self.clubs = clubs
    }
}

public extension ClubListResponseDTO {
    struct Club: Decodable {
        public let id: Int
        public let name: String
    }
}

extension ClubListResponseDTO.Club {
    func toDomain() -> ClubEntity {
        ClubEntity(
            id: id,
            name: name
        )
    }
}

extension ClubListResponseDTO {
    func toDomain() -> [ClubEntity] {
        clubs.map { $0.toDomain() }
    }
}
