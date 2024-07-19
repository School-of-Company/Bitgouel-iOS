import Foundation

public struct SchoolWithClubsResponseDTO: Decodable {
    public let clubID: Int
    public let clubName: String
    public let field: FieldType

    enum CodingKeys: String, CodingKey {
        case clubID = "id"
        case clubName = "name"
        case field
    }
}

extension SchoolWithClubsResponseDTO {
    func toDomain() -> SchoolWithClubsEntity {
        SchoolWithClubsEntity(
            clubID: clubID,
            clubName: clubName,
            field: field
        )
    }
}
