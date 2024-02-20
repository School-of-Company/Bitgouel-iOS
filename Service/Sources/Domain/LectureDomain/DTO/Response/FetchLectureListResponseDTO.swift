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
        public let startDate: String
        public let endDate: String
        public let completeDate: String
        public let lectureType: LectureType
        public let lectureStatus: LectureStatusType
        public let approveStatus: ApproveStatusType
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
            startDate: startDate,
            endDate: endDate,
            completeDate: completeDate,
            lectureType: lectureType,
            lectureStatus: lectureStatus,
            approveStatus: approveStatus,
            headCount: headCount,
            maxRegisteredUser: maxRegisteredUser,
            lecturer: lecturer
        )
    }
}
