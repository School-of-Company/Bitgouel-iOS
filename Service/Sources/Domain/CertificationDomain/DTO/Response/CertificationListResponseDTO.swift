import Foundation

public struct CertificationListResponseDTO: Decodable {
    public let certifications: [CertificationInfo]
    
    public init(certifications: [CertificationInfo]) {
        self.certifications = certifications
    }

    public struct CertificationInfo: Decodable {
        public let certificationId: String
        public let name: String
        public let acquisitionDate: String

        public init(
            certificationId: String,
            name: String,
            acquisitionDate: String
        ) {
            self.certificationId = certificationId
            self.name = name
            self.acquisitionDate = acquisitionDate
        }
    }
}

