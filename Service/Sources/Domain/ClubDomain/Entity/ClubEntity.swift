import Foundation

public struct ClubEntity: Equatable {
    public let clubID: Int
    public let name: String
    public let schoolName: String

    public init(clubID: Int, name: String, schoolName: String) {
        self.clubID = clubID
        self.name = name
        self.schoolName = schoolName
    }
}
