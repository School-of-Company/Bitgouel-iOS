import Foundation

public struct SingleStudentEntity: Equatable {
    public let id: UUID
    public let name: String
    public let authority: UserRoleType
    
    public init(id: UUID, name: String, authority: UserRoleType) {
        self.id = id
        self.name = name
        self.authority = authority
    }
}
