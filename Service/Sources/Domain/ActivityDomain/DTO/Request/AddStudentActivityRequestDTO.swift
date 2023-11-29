import Foundation

public struct AddStudentActivityRequestDTO: Encodable {
    public let title: String
    public let content: String
    public let credit: Int
    public let activityDate: String
}
