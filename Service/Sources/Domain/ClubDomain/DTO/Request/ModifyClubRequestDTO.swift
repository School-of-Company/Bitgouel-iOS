import Foundation

public struct ModifyClubRequestDTO: Encodable {
    public let name: String
    public let field: FieldType
    public let schoolID: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case field
        case schoolID = "schoolId"
    }
}
