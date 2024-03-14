import Foundation

public struct FetchLectureListResponseDTO: Decodable {
    public let lectures: [LectureInfo]
    
    public init(
        lectures: [LectureInfo]
    ) {
        self.lectures = lectures
    }
    
    public struct LectureInfo: Decodable {
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
            id: id,
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
