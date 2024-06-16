import Foundation

public struct SchoolResponseDTO: Decodable {
    public let schoolID: Int
    public let schoolName: String
    public let clubs: [ClubResponseDTO]

    enum CodingKeys: String, CodingKey {
        case schoolID = "id"
        case schoolName
        case clubs
    }
}

extension SchoolResponseDTO {
    func toDomain() -> SchoolListEntity {
        SchoolListEntity(
            id: schoolID,
            schoolName: schoolName,
            clubs: clubs.map { $0.toDomain() }
        )
    }
}
