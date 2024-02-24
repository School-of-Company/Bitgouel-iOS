import Foundation

public struct CertificationInfoEntity: Equatable {
    public let certificationID: String
    public let name: String
    public let acquisitionDate: String

    public init(
        certificationID: String,
        name: String,
        acquisitionDate: String
    ) {
        self.certificationID = certificationID
        self.name = name
        self.acquisitionDate = acquisitionDate
    }
}
