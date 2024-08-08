import Foundation

public struct ModifyClubRequestDTO: Encodable {
    public let name: String
    public let field: FieldType
    public let schoolID: Int

    public init(
        name: String,
        field: FieldType,
        schoolID: Int
    ) {
        self.name = name
        self.field = field
        self.schoolID = schoolID
    }

    enum CodingKeys: String, CodingKey {
        case name
        case field
        case schoolID = "schoolId"
    }
}
