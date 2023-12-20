import Foundation

public struct ClubDetailEntity: Equatable {
    public let clubName: String
    public let highSchoolName: String
    public let studentHeadcount: Int

    public init(clubName: String, highSchoolName: String, studentHeadcount: Int) {
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.studentHeadcount = studentHeadcount
    }
}
