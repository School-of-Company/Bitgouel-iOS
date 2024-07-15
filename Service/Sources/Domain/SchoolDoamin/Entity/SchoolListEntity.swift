import Foundation

public struct SchoolListEntity: Equatable {
    public let schoolID: Int
    public let schoolName: String
    public let line: LineType
    public let departments: [String]
    public let logoImageURL: String
    public let clubs: [SchoolWithClubsEntity]
}
