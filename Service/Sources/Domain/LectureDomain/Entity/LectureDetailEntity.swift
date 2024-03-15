import Foundation

public struct LectureDetailEntity: Equatable {
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: DivisionType
    public let department: String
    public let line: String
    public let createAt: String
    public let startDate: String
    public let endDate: String
    public let lectureDates: [LectureDateEntity]
    public let lectureType: LectureType
    public let lectureStatus: LectureStatusType
    public let headCount: Int
    public let maxRegisteredUser: Int
    public let isRegistered: Bool
    public let lecturer: String
    public let credit: Int

    public init(
        name: String,
        content: String,
        semester: SemesterType,
        division: DivisionType,
        department: String,
        line: String,
        createAt: String,
        startDate: String,
        endDate: String,
        lectureDates: [LectureDateEntity],
        lectureType: LectureType,
        lectureStatus: LectureStatusType,
        headCount: Int,
        maxRegisteredUser: Int,
        isRegistered: Bool,
        lecturer: String,
        credit: Int
    ) {
        self.name = name
        self.content = content
        self.semester = semester
        self.division = division
        self.department = department
        self.line = line
        self.createAt = createAt
        self.startDate = startDate
        self.endDate = endDate
        self.lectureDates = lectureDates
        self.lectureType = lectureType
        self.lectureStatus = lectureStatus
        self.headCount = headCount
        self.maxRegisteredUser = maxRegisteredUser
        self.isRegistered = isRegistered
        self.lecturer = lecturer
        self.credit = credit
    }
}

public struct LectureDateEntity: Equatable {
    public let completeDate: String
    public let startTime: String
    public let endTime: String

    public init(
        completeDate: String,
        startTime: String,
        endTime: String
    ) {
        self.completeDate = completeDate
        self.startTime = startTime
        self.endTime = endTime
    }
}
