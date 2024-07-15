import Foundation

public struct FetchSchoolNameResponseDTO: Decodable {
    public let schools: [SchoolNameResponseDTO]

    public init(schools: [SchoolNameResponseDTO]) {
        self.schools = schools
    }

    public struct SchoolNameResponseDTO: Decodable {
        public let schoolName: String
    }
}

extension FetchSchoolNameResponseDTO {
    func toDomain() -> [String] {
        schools.map(\.schoolName)
    }
}
