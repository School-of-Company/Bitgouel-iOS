import Foundation

public struct CertificationInfoEntity: Equatable {
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
