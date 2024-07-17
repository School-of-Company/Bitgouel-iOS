import Foundation

public struct CreatedCompanyRequestDTO: Encodable {
    public let companyName: String
    public let field: FieldType
}
