import Foundation

public struct SchoolInfoModel: Equatable {
    public let schoolName: String
    public let clubs: [ClubInfoModel]

    public init(
        schoolName: String,
        clubs: [ClubInfoModel]
    ) {
        self.schoolName = schoolName
        self.clubs = clubs
    }
}

public struct ClubInfoModel: Equatable {
    public let clubID: Int
    public let clubName: String

    public init(
        clubID: Int,
        clubName: String
    ) {
        self.clubID = clubID
        self.clubName = clubName
    }
}
