import Foundation

public struct FetchSchoolListResponseDTO: Decodable {
    public let schools: [SchoolResponseDTO]
}

extension FetchSchoolListResponseDTO {
    func toDomain() -> [SchoolListEntity] {
        schools.map { $0.toDomain() }
    }
}
