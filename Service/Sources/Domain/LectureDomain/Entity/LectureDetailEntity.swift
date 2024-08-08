import Foundation

public struct LectureDetailEntity: Equatable {
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: String
    public let department: String
    public let line: String
    public let createAt: Date
    public let startDate: Date
    public let endDate: Date
    public let lectureDates: [LectureDateEntity]
    public let lectureType: String
    public let lectureStatus: LectureStatusType
    public let maxRegisteredUser: Int
    public let isRegistered: Bool
    public let instructor: String
    public let userID: String
    public let credit: Int
    public let locationX: String
    public let locationY: String
    public let address: String
    public let locationDetails: String
    public let essentialComplete: Bool

    public init(
        name: String,
        content: String,
        semester: SemesterType,
        division: String,
        department: String,
        line: String,
        createAt: Date,
        startDate: Date,
        endDate: Date,
        lectureDates: [LectureDateEntity],
        lectureType: String,
        lectureStatus: LectureStatusType,
        maxRegisteredUser: Int,
        isRegistered: Bool,
        instructor: String,
        userID: String,
        credit: Int,
        locationX: String,
        locationY: String,
        address: String,
        locationDetails: String,
        essentialComplete: Bool
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
        self.maxRegisteredUser = maxRegisteredUser
        self.isRegistered = isRegistered
        self.instructor = instructor
        self.userID = userID
        self.credit = credit
        self.locationX = locationX
        self.locationY = locationY
        self.address = address
        self.locationDetails = locationDetails
        self.essentialComplete = essentialComplete
    }
}

public struct LectureDateEntity: Equatable {
    public let completeDate: Date
    public let startTime: Date
    public let endTime: Date

    public init(
        completeDate: Date,
        startTime: Date,
        endTime: Date
    ) {
        self.completeDate = completeDate
        self.startTime = startTime
        self.endTime = endTime
    }
}
