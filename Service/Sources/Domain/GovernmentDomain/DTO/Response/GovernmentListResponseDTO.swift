import Foundation

public struct GovernmentListResponseDTO: Decodable {
    public let governments: [GovernmentInfoResponseDTO]
}

public struct GovernmentInfoResponseDTO: Decodable {
    public let governmentID: Int
    public let field: FieldType
    public let governmentName: String
}

extension GovernmentListResponseDTO {
    func toDomain() -> [GovernmentInfoEntity] {
        governments.map { $0.toDomain() }
    }
}

extension GovernmentInfoResponseDTO {
    func toDomain() -> GovernmentInfoEntity {
        GovernmentInfoEntity(
            governmentID: governmentID,
            field: field,
            governmentName: governmentName
        )
    }
}
