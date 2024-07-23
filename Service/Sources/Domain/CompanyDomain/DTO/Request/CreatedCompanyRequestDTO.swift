import Foundation

public struct CreatedCompanyRequestDTO: Encodable {
    public let companyName: String
    public let field: FieldType

    public init(
        companyName: String,
        field: FieldType
    ) {
        self.companyName = companyName
        self.field = field
    }
}
