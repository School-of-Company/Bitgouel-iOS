import Foundation

public struct FetchInstructorListResponseDTO: Decodable {
    public let instructors: [InstructorInfo]

    public init(instructors: [InstructorInfo]) {
        self.instructors = instructors
    }

    public struct InstructorInfo: Decodable {
        public let instructorID: String
        public let name: String
        public let organization: String
        public let authority: UserAuthorityType

        public init(
            instructorID: String,
            name: String,
            organization: String,
            authority: UserAuthorityType
        ) {
            self.instructorID = instructorID
            self.name = name
            self.organization = organization
            self.authority = authority
        }

        enum CodingKeys: String, CodingKey {
            case instructorID = "id"
            case name
            case organization
            case authority
        }
    }
}

extension FetchInstructorListResponseDTO {
    func toDomain() -> [InstructorInfoEntity] {
        instructors.map { $0.toDomain() }
    }
}

extension FetchInstructorListResponseDTO.InstructorInfo {
    func toDomain() -> InstructorInfoEntity {
        InstructorInfoEntity(
            instructorID: instructorID,
            name: name,
            organization: organization,
            authority: authority
        )
    }
}
