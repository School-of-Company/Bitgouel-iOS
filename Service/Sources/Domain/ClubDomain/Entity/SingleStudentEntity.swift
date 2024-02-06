import Foundation

public struct SingleStudentEntity: Equatable {
    public let id: String
    public let name: String
    public let authority: UserAuthorityType

    public init(id: String, name: String, authority: UserAuthorityType) {
        self.id = id
        self.name = name
        self.authority = authority
    }
}
