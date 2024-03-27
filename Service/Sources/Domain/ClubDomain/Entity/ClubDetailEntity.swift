import Foundation

public struct ClubDetailEntity: Equatable {
    public let clubID: Int
    public let clubName: String
    public let highSchoolName: String
    public let students: [MemberInfoEntity]
    public let teacher: MemberInfoEntity

    public init(
        clubID: Int,
        clubName: String,
        highSchoolName: String,
        students: [MemberInfoEntity],
        teacher: MemberInfoEntity
    ) {
        self.clubID = clubID
        self.clubName = clubName
        self.highSchoolName = highSchoolName
        self.students = students
        self.teacher = teacher
    }
}

public extension ClubDetailEntity {
    struct MemberInfoEntity: Equatable {
        public let studentID: String
        public let name: String

        public init(studentID: String, name: String) {
            self.studentID = studentID
            self.name = name
        }
    }
}
