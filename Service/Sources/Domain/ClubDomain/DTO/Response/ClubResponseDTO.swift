import Foundation

public struct ClubResponseDTO: Decodable {
    public let clubID: Int
    public let name: String
    public let schoolName: String

    enum CodingKeys: String, CodingKey {
        case clubID = "id"
        case name
        case schoolName
    }
}

public extension ClubResponseDTO {
    func toDomain() -> ClubEntity {
        ClubEntity(
            clubID: clubID,
            name: name,
            schoolName: schoolName
        )
    }
}
