import Foundation

public struct FetchLectureListResponseDTO: Decodable {
    public var id = UUID()
    public let name: String
    public let content: String
    public let startDate: String
    public let endDate: String
    public let completeDate: String
    public let lectureType: LectureType
    public let lectureStatus: LectureStatusType
    public let headCount: Int
    public let maxRegisteredUser: Int
    public let lecturer: String
    
    public init(
        id: UUID = UUID(),
        name: String,
        content: String,
        startDate: String,
        endDate: String,
        completeDate: String,
        lectureType: LectureType,
        lectureStatus: LectureStatusType,
        headCount: Int,
        maxRegisteredUser: Int,
        lecturer: String
    ) {
        self.id = id
        self.name = name
        self.content = content
        self.startDate = startDate
        self.endDate = endDate
        self.completeDate = completeDate
        self.lectureType = lectureType
        self.lectureStatus = lectureStatus
        self.headCount = headCount
        self.maxRegisteredUser = maxRegisteredUser
        self.lecturer = lecturer
    }
}

public extension FetchLectureListResponseDTO {
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
            headCount: headCount,
            maxRegisteredUser: maxRegisteredUser,
            lecturer: lecturer
        )
    }
}
