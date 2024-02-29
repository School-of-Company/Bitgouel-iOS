import Foundation

public struct CertificationInfoEntity: Equatable {
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
}
