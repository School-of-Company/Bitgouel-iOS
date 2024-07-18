import Foundation

public struct CreatedGovernmentRequestDTO: Encodable {
    public let field: FieldType
    public let governmentName: String

    public init(
        field: FieldType,
        governmentName: String
    ) {
        self.field = field
        self.governmentName = governmentName
    }
}
