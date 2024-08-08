import Foundation

public struct FetchLectureDetailResponseDTO: Decodable {
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: String
    public let department: String
    public let line: String
    public let createAt: String
    public let startDate: String
    public let endDate: String
    public let lectureDates: [LectureDate]
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
        createAt: String,
        startDate: String,
        endDate: String,
        lectureDates: [LectureDate],
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

    public struct LectureDate: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case name
        case content
        case semester
        case division
        case department
        case line
        case createAt
        case startDate
        case endDate
        case lectureDates
        case lectureType
        case lectureStatus
        case maxRegisteredUser
        case isRegistered
        case instructor = "lecturer"
        case userID = "userId"
        case credit
        case locationX
        case locationY
        case address
        case locationDetails
        case essentialComplete
    }
}

extension FetchLectureDetailResponseDTO {
    func toDomain() -> LectureDetailEntity {
        LectureDetailEntity(
            name: name,
            content: content,
            semester: semester,
            division: division,
            department: department,
            line: line,
            createAt: createAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            startDate: startDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            endDate: endDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            lectureDates: lectureDates.map { $0.toDomain() },
            lectureType: lectureType,
            lectureStatus: lectureStatus,
            maxRegisteredUser: maxRegisteredUser,
            isRegistered: isRegistered,
            instructor: instructor,
            userID: userID,
            credit: credit,
            locationX: locationX,
            locationY: locationY,
            address: address,
            locationDetails: locationDetails,
            essentialComplete: essentialComplete
        )
    }
}

extension FetchLectureDetailResponseDTO.LectureDate {
    func toDomain() -> LectureDateEntity {
        LectureDateEntity(
            completeDate: completeDate.toDateCustomFormat(format: "yyyy-MM-dd"),
            startTime: startTime.toDateCustomFormat(format: "hh:mm:ss"),
            endTime: endTime.toDateCustomFormat(format: "hh:mm:ss")
        )
    }
}
