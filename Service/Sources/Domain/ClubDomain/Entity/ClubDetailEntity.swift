import Foundation

public struct ClubDetailEntity: Equatable {
    public let clubID: Int
    public let clubName: String
    public let highSchoolName: String
    public let students: [MemberInfoEntity]
    public let teacher: TeacherInfoEntity

    public init(
        clubID: Int,
        clubName: String,
        highSchoolName: String,
        students: [MemberInfoEntity],
        teacher: TeacherInfoEntity
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
        public let userID: String
        public let studentID: String
        public let name: String

        public init(
            userID: String,
            studentID: String,
            name: String
        ) {
            self.userID = userID
            self.studentID = studentID
            self.name = name
        }
    }
}

public extension ClubDetailEntity {
    struct TeacherInfoEntity: Equatable {
        public let teacherID: String
        public let name: String

        public init(
            teacherID: String,
            name: String
        ) {
            self.teacherID = teacherID
            self.name = name
        }
    }
}
