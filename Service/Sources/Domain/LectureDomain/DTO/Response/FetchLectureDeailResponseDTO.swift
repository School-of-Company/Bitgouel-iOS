import Foundation

public struct FetchLectureDetailResponseDTO: Decodable {
    public let name: String
    public let content: String
    public let createAt: String
    public let startDate: String
    public let endDate: String
    public let completedDate: String
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
        createAt: String,
        startDate: String,
        endDate: String,
        completedDate: String,
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
        self.createAt = createAt
        self.startDate = startDate
        self.endDate = endDate
        self.completedDate = completedDate
        self.lectureType = lectureType
        self.lectureStatus = lectureStatus
        self.headCount = headCount
        self.maxRegisteredUser = maxRegisteredUser
        self.isRegistered = isRegistered
        self.lecturer = lecturer
        self.credit = credit
    }
}
