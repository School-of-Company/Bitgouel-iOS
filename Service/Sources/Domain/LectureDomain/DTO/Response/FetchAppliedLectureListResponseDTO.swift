import Foundation

public struct FetchAppliedLectureListResponseDTO: Decodable {
    public let lectures: [AppliedLectureInfoResponseDTO]

    public init(lectures: [AppliedLectureInfoResponseDTO]) {
        self.lectures = lectures
    }
}

public struct AppliedLectureInfoResponseDTO: Decodable {
    public let lectureID: String
    public let name: String
    public let lectureType: String
    public let currentCompletedDate: String
    public let instructor: String
    public let isComplete: Bool

    public init(
        lectureID: String,
        name: String,
        lectureType: String,
        currentCompletedDate: String,
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

    enum CodingKeys: String, CodingKey {
        case lectureID = "id"
        case name
        case lectureType
        case currentCompletedDate
        case instructor = "lecturer"
        case isComplete
    }
}

extension FetchAppliedLectureListResponseDTO {
    func toDomain() -> [AppliedLectureEntity] {
        lectures.map { $0.toDomain() }
    }
}

extension AppliedLectureInfoResponseDTO {
    func toDomain() -> AppliedLectureEntity {
        AppliedLectureEntity(
            lectureID: lectureID,
            name: name,
            lectureType: lectureType,
            currentCompletedDate: currentCompletedDate.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss"),
            instructor: instructor,
            isComplete: isComplete
        )
    }
}
