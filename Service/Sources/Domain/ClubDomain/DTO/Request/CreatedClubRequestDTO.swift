import Foundation

public struct CreatedClubRequestDTO: Encodable {
    public let name: String
    public let field: FieldType
    
    public init(
        name: String,
        field: FieldType
    ) {
        self.name = name
        self.field = field
    }
}
