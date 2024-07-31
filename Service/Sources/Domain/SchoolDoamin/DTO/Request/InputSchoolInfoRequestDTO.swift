import Foundation

public struct InputSchoolInfoRequestDTO: Encodable {
    public let schoolName: String
    public let line: String
    public let departments: [String]

    public init(
        schoolName: String,
        line: String,
        departments: [String]
    ) {
        self.schoolName = schoolName
        self.line = line
        self.departments = departments
    }
}
