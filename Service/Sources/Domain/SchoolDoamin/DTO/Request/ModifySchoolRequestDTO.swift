import Foundation

public struct ModifySchoolRequestDTO: Encodable {
    public let schoolName: String
    public let line: LineType
    public let logoImage: Data
}
