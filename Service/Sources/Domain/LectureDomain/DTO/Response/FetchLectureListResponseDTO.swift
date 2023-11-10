import Foundation

public struct LectureListInquiryResponseDTO: Decodable {
    public var userID = UUID()
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
}

public extension LectureListInquiryResponseDTO
