import Foundation

public struct StudentListByClubResponseDTO: Decodable {
    public let students: [Student]
}

public extension StudentListByClubResponseDTO {
    struct Student: Decodable {
        public let id: UUID
        public let name: String
        public let authority: UserAuthorityType
    }
}

extension StudentListByClubResponseDTO.Student {
    func toDomain() -> SingleStudentEntity {
        SingleStudentEntity(
            id: id,
            name: name,
            authority: authority
        )
    }
}

extension StudentListByClubResponseDTO {
    func toDomain() -> StudentsEntity {
        StudentsEntity(
            students: students.map { $0.toDomain() }
        )
    }
}
