import Foundation

public struct CompanyListResponseDTO: Decodable {
    public let companies: [CompanyInfoResponseDTO]
}

public struct CompanyInfoResponseDTO: Decodable {
    public let companyID: Int
    public let companyName: String
    public let field: FieldType

    enum CodingKeys: String, CodingKey {
        case companyID = "id"
        case companyName
        case field
    }
}

extension CompanyListResponseDTO {
    func toDomain() -> [CompanyInfoEntity] {
        companies.map { $0.toDomain() }
    }
}

extension CompanyInfoResponseDTO {
    func toDomain() -> CompanyInfoEntity {
        CompanyInfoEntity(
            companyID: companyID,
            companyName: companyName,
            field: field
        )
    }
}
