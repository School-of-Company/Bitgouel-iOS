import Foundation
import Service

public struct OrganizationListModel: Equatable {
    public let organizationID: Int
    public let name: String
    public let field: FieldType

    public init(
        organizationID: Int,
        name: String,
        field: FieldType
    ) {
        self.organizationID = organizationID
        self.name = name
        self.field = field
    }
}
