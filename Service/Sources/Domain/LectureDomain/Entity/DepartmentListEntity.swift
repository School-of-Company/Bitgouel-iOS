import Foundation

public struct DepartmentListEntity: Equatable {
    public let departments: [String]
    
    public init(departments: [String]) {
        self.departments = departments
    }
}
