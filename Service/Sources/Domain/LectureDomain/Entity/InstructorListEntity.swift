import Foundation

public struct InstructorInfoEntity: Equatable {
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
}
