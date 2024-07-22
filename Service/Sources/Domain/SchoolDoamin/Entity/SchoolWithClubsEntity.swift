import Foundation

public struct SchoolWithClubsEntity: Equatable {
    public let clubID: Int
    public let clubName: String
    public let field: FieldType

    public init(
        clubID: Int,
        clubName: String,
        field: FieldType
    ) {
        self.clubID = clubID
        self.clubName = clubName
        self.field = field
    }
}
