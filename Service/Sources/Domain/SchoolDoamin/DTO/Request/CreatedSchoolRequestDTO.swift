import Foundation

public struct CreatedSchoolRequestDTO: Encodable {
    public let schoolName: String
    public let line: LineType
    public let department: [String]
    public let logoImage: Data
}
