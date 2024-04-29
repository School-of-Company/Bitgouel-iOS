import Foundation

public struct AppliedLectureEntity: Equatable {
    public let lectureID: String
    public let name: String
    public let lectureType: String
    public let currentCompletedDate: Date
    public let instructor: String
    public let isComplete: Bool

    public init(
        lectureID: String,
        name: String,
        lectureType: String,
        currentCompletedDate: Date,
        instructor: String,
        isComplete: Bool
    ) {
        self.lectureID = lectureID
        self.name = name
        self.lectureType = lectureType
        self.currentCompletedDate = currentCompletedDate
        self.instructor = instructor
        self.isComplete = isComplete
    }
}
