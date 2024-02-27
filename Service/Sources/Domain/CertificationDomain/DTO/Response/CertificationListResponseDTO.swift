import Foundation

public struct CertificationListResponseDTO: Decodable {
    public let certifications: [CertificationInfo]

    public init(certifications: [CertificationInfo]) {
        self.certifications = certifications
    }

    public struct CertificationInfo: Decodable {
        public let certificationID: String
        public let name: String
        public let acquisitionDate: Date

        public init(
            certificationID: String,
            name: String,
            acquisitionDate: Date
        ) {
            self.certificationID = certificationID
            self.name = name
            self.acquisitionDate = acquisitionDate
        }
        
        enum CodingKeys: String, CodingKey {
            case certificationID = "certificationId"
            case name
            case acquisitionDate
        }
    }
}

extension CertificationListResponseDTO {
    func toDomain() -> [CertificationInfoEntity] {
        certifications.map { $0.toDomain() }
    }
}

extension CertificationListResponseDTO.CertificationInfo {
    func toDomain() -> CertificationInfoEntity {
        CertificationInfoEntity(
            certificationID: certificationID,
            name: name,
            acquisitionDate: acquisitionDate
        )
    }
}
