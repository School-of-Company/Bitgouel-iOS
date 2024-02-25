import Foundation

public struct ClubDetailEntity: Equatable {
    public let clubID: Int
    public let clubName: String
    public let highSchoolName: String
    public let headcount: Int
    public let students: [memberInfoEntity]
    public let teacher: memberInfoEntity

    public init(
        clubID: Int,
        clubName: String,
        highSchoolName: String,
        headcount: Int,
        students: [memberInfoEntity],
        teacher: memberInfoEntity
    ) {
        self.clubID = clubID
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.headcount = headcount
        self.students = students
        self.teacher = teacher
    }
}

public extension ClubDetailEntity {
    struct memberInfoEntity: Equatable {
        public let id: String
        public let name: String

        public init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }
}
