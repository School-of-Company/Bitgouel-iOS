import Foundation

public struct ClubListResponseDTO: Decodable {
    public let clubs: [ClubResponseDTO]
}

extension ClubListResponseDTO {
    func toDomain() -> [ClubEntity] {
        clubs.map { $0.toDomain() }
    }
}
