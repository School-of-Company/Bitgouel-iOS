import Foundation

public struct FetchSchoolListResponseDTO: Decodable {
    public let schools: [SchoolListResponseDTO]
}

extension FetchSchoolListResponseDTO {
    func toDomain() -> [SchoolListEntity] {
        schools.map { $0.toDomain() }
    }
}
