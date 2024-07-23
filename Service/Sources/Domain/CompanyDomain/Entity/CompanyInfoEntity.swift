import Foundation

public struct CompanyInfoEntity: Equatable {
    public let companyID: Int
    public let companyName: String
    public let field: FieldType

    public init(
        companyID: Int,
        companyName: String,
        field: FieldType
    ) {
        self.companyID = companyID
        self.companyName = companyName
        self.field = field
    }
}
