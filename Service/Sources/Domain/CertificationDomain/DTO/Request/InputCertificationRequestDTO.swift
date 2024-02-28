import Foundation

public struct InputCertificationRequestDTO: Encodable {
    public let name: String
    public let acquisitionDate: String

    public init(name: String, acquisitionDate: String) {
        self.name = name
        self.acquisitionDate = acquisitionDate
    }
}
