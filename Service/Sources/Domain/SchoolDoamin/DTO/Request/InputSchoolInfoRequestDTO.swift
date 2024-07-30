import Foundation

public struct InputSchoolInfoRequestDTO: Encodable {
    public let schoolName: String
    public let line: LineType
    public let departments: [String]
    public let logoImage: Data

    public init(
        schoolName: String,
        line: LineType,
        departments: [String],
        logoImage: Data
    ) {
        self.schoolName = schoolName
        self.line = line
        self.departments = departments
        self.logoImage = logoImage
    }
}
