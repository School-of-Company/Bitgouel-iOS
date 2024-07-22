import Foundation

public struct SchoolListEntity: Equatable {
    public let schoolID: Int
    public let schoolName: String
    public let line: LineType
    public let departments: [String]
    public let logoImageURL: String
    public let clubs: [SchoolWithClubsEntity]

    public init(
        schoolID: Int,
        schoolName: String,
        line: LineType,
        departments: [String],
        logoImageURL: String,
        clubs: [SchoolWithClubsEntity]
    ) {
        self.schoolID = schoolID
        self.schoolName = schoolName
        self.line = line
        self.departments = departments
        self.logoImageURL = logoImageURL
        self.clubs = clubs
    }
}
