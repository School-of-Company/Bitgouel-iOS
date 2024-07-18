import Foundation

public struct DepartmentResponseDTO: Decodable {
    public let name: String
}

public extension DepartmentResponseDTO {
    func toDomain() -> String {
        return name
    }
}
