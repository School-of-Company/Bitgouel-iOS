import Foundation

public struct ClubDetailEntity: Equatable {
    public let clubName: String
    public let highSchoolName: String
    public let students: [memberInfoEntity]
    public let teacher: memberInfoEntity

    public init(
        clubName: String,
        highSchoolName: String,
        students: [memberInfoEntity],
        teacher: memberInfoEntity
    ) {
        self.clubName = clubName
        self.highSchoolName = highSchoolName
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
