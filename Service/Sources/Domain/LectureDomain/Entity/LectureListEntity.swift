import Foundation

public struct LectureListEntity: Equatable {
    public var id: String
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: DivisionType
    public let department: String
    public let line: String
    public let startDate: String
    public let endDate: String
    public let lectureType: LectureType
    public let lectureStatus: LectureStatusType
    public let headCount: Int
    public let maxRegisteredUser: Int
    public let lecturer: String

    public init(
        id: String,
        name: String,
        content: String,
        semester: SemesterType,
        division: DivisionType,
        department: String,
        line: String,
        startDate: String,
        endDate: String,
        lectureType: LectureType,
        lectureStatus: LectureStatusType,
        headCount: Int,
        maxRegisteredUser: Int,
        lecturer: String
    ) {
        self.id = id
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
        self.lecturer = lecturer
    }
}
