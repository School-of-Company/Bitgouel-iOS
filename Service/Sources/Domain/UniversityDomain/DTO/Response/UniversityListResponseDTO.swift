import Foundation

public struct UniversityListResponseDTO: Decodable {
    public let universities: [UniversityInfoResponseDTO]
}

public struct UniversityInfoResponseDTO: Decodable {
    public let universityID: String
    public let universityName: String
    public let departments: [String]

    enum CodingKeys: String, CodingKey {
        case universityID = "id"
        case universityName
        case departments
    }
}

extension UniversityListResponseDTO {
    func toDomain() -> [UniversityInfoEntity] {
        universities.map { $0.toDomain() }
    }
}

extension UniversityInfoResponseDTO {
    func toDomain() -> UniversityInfoEntity {
        UniversityInfoEntity(
            universityID: universityID,
            universityName: universityName,
            departments: departments
        )
    }
}
