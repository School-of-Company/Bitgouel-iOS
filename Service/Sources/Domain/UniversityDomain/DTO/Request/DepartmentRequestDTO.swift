import Foundation

public struct DepartmentRequestDTO: Encodable {
    public let department: String

    public init(department: String) {
        self.department = department
    }
}
