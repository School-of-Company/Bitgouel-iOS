import Foundation

public struct SingleStudentEntity: Equatable {
    public let id: UUID
    public let name: String
    public let authority: UserAuthorityType

    public init(id: UUID, name: String, authority: UserAuthorityType) {
        self.id = id
        self.name = name
        self.authority = authority
    }
}
