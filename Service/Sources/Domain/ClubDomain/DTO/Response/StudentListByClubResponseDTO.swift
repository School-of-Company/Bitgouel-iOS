import Foundation

public struct StudentListByClubResponseDTO: Decodable {
    public let students: [Student]

    init(students: [Student]) {
        self.students = students
    }
}

public extension StudentListByClubResponseDTO {
    struct Student: Decodable {
        public let id: UUID
        public let name: String
    }
}

extension StudentListByClubResponseDTO.Student {
    func toDomain() -> StudentEntity {
        StudentEntity(
            id: id,
            name: name
        )
    }
}

extension StudentListByClubResponseDTO {
    func toDomain() -> [StudentEntity] {
        students.map { $0.toDomain() }
    }
}
