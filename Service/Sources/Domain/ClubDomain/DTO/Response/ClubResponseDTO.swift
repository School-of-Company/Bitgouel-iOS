import Foundation

public struct ClubResponseDTO: Decodable {
    public let id: Int
    public let name: String
}

extension ClubResponseDTO {
    public func toDomain() -> ClubEntity {
        ClubEntity(
            id: id,
            name: name
        )
    }
}
