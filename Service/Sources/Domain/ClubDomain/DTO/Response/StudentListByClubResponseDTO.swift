import Foundation

public struct StudentListByClubResponseDTO: Decodable {
    public let students: [Student]
}

public extension StudentListByClubResponseDTO {
    struct Student: Decodable {
        public let id: UUID
        public let name: String
        public let authority: UserRoleType
    }
}
