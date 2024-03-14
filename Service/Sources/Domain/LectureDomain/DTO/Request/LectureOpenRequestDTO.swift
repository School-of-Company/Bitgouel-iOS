import Foundation

public struct LectureOpenRequestDTO: Encodable {
    public struct LectureDates: Encodable {
        public let completeDate: Date
        public let startTime: Date
        public let endTime: Date
    }
    
    public let name: String
    public let content: String
    public let semester: SemesterType
    public let division: DivisionType
    public let department: String
    public let line: String
    public let startDate: String
    public let endData: String
    public let lectureDates: [LectureDates]
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
        startDate: String,
        endData: String,
        lectureDates: [LectureDates],
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
        self.startDate = startDate
        self.endData = endData
        self.lectureDates = lectureDates
        self.lectureType = lectureType
        self.credit = credit
        self.maxRegisteredUser = maxRegisteredUser
    }
}
