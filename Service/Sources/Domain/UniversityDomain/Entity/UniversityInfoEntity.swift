import Foundation

public struct UniversityInfoEntity: Equatable {
    public let universityID: Int
    public let universityName: String
    public let departments: [String]

    public init(
        universityID: Int,
        universityName: String,
        departments: [String]
    ) {
        self.universityID = universityID
        self.universityName = universityName
        self.departments = departments
    }
}
