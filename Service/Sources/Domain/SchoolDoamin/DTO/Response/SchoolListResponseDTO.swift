import Foundation

public struct SchoolListResponseDTO: Decodable {
    public let schoolID: Int
    public let schoolName: String
    public let line: LineType
    public let departments: [DepartmentResponseDTO]
    public let logoImageURL: String
    public let clubs: [SchoolWithClubsResponseDTO]

    enum CodingKeys: String, CodingKey {
        case schoolID = "id"
        case schoolName = "name"
        case line
        case departments
        case logoImageURL = "logoImageUrl"
        case clubs
    }
}

extension SchoolListResponseDTO {
    func toDomain() -> SchoolListEntity {
        SchoolListEntity(
            schoolID: schoolID,
            schoolName: schoolName,
            line: line,
            departments: departments.map { $0.toDomain() },
            logoImageURL: logoImageURL,
            clubs: clubs.map { $0.toDomain() }
        )
    }
}
