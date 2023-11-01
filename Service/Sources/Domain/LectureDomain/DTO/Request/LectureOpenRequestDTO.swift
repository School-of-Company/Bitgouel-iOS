import Foundation

public struct LectureOpenRequestDTO: Encodable {
    public let name: String
    public let content: String
    public let startDate: String
    public let endData: String
    public let completeDate: String
    public let lectureType: LectureType
    public let credit: Int
    public let maxRegisteredUser: Int

    public init(
        name: String,
        content: String,
        startDate: String,
        endData: String,
        completeDate: String,
        lectureType: LectureType,
        credit: Int,
        maxRegisteredUser: Int
    ) {
        self.name = name
        self.content = content
        self.startDate = startDate
        self.endData = endData
        self.completeDate = completeDate
        self.lectureType = lectureType
        self.credit = credit
        self.maxRegisteredUser = maxRegisteredUser
    }
}
