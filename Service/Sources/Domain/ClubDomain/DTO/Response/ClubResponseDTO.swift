import Foundation

public struct ClubResponseDTO: Decodable {
    public let id: Int
    public let name: String
}

public extension ClubResponseDTO {
    func toDomain() -> ClubEntity {
        ClubEntity(
            id: id,
            name: name
        )
    }
}
