import Foundation

public struct InputLectureRequestDTO: Encodable {
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: String
    public let department: String
    public let line: String
    public let userID: String
    public let startDate: String
    public let endDate: String
    public let lectureDates: [LectureDateInfo]
    public let lectureType: String
    public let credit: Int
    public let maxRegisteredUser: Int
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
        userID: String,
        startDate: String,
        endDate: String,
        lectureDates: [LectureDateInfo],
        lectureType: String,
        credit: Int,
        maxRegisteredUser: Int,
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
        self.userID = userID
        self.startDate = startDate
        self.endDate = endDate
        self.lectureDates = lectureDates
        self.lectureType = lectureType
        self.credit = credit
        self.maxRegisteredUser = maxRegisteredUser
        self.address = address
        self.locationDetails = locationDetails
        self.essentialComplete = essentialComplete
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
        case endDate
        case lectureDates
        case lectureType
        case credit
        case maxRegisteredUser
        case address
        case locationDetails
        case essentialComplete
    }

    public struct LectureDateInfo: Encodable {
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
}
