import Foundation

public struct LectureListEntity: Equatable {
    public var lectureID: String
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: String
    public let department: String
    public let line: String
    public let startDate: Date
    public let endDate: Date
    public let lectureType: LectureType
    public let lectureStatus: LectureStatusType
    public let headCount: Int
    public let maxRegisteredUser: Int
    public let instructor: String

    public init(
        lectureID: String,
        name: String,
        content: String,
        semester: SemesterType,
        division: String,
        department: String,
        line: String,
        startDate: Date,
        endDate: Date,
        lectureType: LectureType,
        lectureStatus: LectureStatusType,
        headCount: Int,
        maxRegisteredUser: Int,
        instructor: String
    ) {
        self.lectureID = lectureID
        self.name = name
        self.content = content
        self.semester = semester
        self.division = division
        self.department = department
        self.line = line
        self.startDate = startDate
        self.endDate = endDate
        self.lectureType = lectureType
        self.lectureStatus = lectureStatus
        self.headCount = headCount
        self.maxRegisteredUser = maxRegisteredUser
        self.instructor = instructor
    }
}

public struct LectureContentEntity: Equatable {
    public let content: [LectureListEntity]

    public init(content: [LectureListEntity]) {
        self.content = content
    }
}
