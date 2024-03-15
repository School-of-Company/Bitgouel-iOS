import Foundation

public struct OpenLectureRequestDTO: Encodable {
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: DivisionType
    public let department: String
    public let line: String
    public let userID: String
    public let startDate: String
    public let endData: String
    public let lectureDates: [LectureDateInfo]
    public let lectureType: LectureType
    public let credit: Int
    public let maxRegisteredUser: Int

    public init(
        name: String,
        content: String,
        semester: SemesterType,
        division: DivisionType,
        department: String,
        line: String,
        userID: String,
        startDate: String,
        endData: String,
        lectureDates: [LectureDateInfo],
        lectureType: LectureType,
        credit: Int,
        maxRegisteredUser: Int
    ) {
        self.name = name
        self.content = content
        self.semester = semester
        self.division = division
        self.department = department
        self.line = line
        self.userID = userID
        self.startDate = startDate
        self.endData = endData
        self.lectureDates = lectureDates
        self.lectureType = lectureType
        self.credit = credit
        self.maxRegisteredUser = maxRegisteredUser
    }

    enum CodingKeys: String, CodingKey {
        case name
        case content
        case semester
        case division
        case department
        case line
        case userID = "userId"
        case startDate
        case endData
        case lectureDates
        case lectureType
        case credit
        case maxRegisteredUser
    }

    public struct LectureDateInfo: Encodable {
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
}
