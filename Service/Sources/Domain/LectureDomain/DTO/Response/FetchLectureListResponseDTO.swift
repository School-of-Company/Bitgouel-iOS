import Foundation

public struct FetchLectureListResponseDTO: Decodable {
    public let lectures: [LectureInfo]
    
    public init(
        lectures: [LectureInfo]
    ) {
        self.lectures = lectures
    }
    
    public struct LectureInfo: Decodable {
        public var lectureID: String
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
            lectureID: String,
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
            self.lecturer = lecturer
        }

        enum CodingKeys: String, CodingKey {
            case lectureID = "id"
            case name
            case content
            case semester
            case division
            case department
            case line
            case startDate
            case endDate
            case lectureType
            case lectureStatus
            case headCount
            case maxRegisteredUser
            case lecturer
        }
    }
}

extension FetchLectureListResponseDTO {
    func toDomain() -> [LectureListEntity] {
        lectures.map { $0.toDomain() }
    }
}
    
extension FetchLectureListResponseDTO.LectureInfo {
    func toDomain() -> LectureListEntity {
        LectureListEntity(
            lectureID: lectureID,
            name: name,
            content: content,
            semester: semester,
            division: division,
            department: department,
            line: line,
            startDate: startDate,
            endDate: endDate,
            lectureType: lectureType,
            lectureStatus: lectureStatus,
            headCount: headCount,
            maxRegisteredUser: maxRegisteredUser,
            lecturer: lecturer
        )
    }
}
