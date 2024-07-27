import Foundation

public struct UniversityNameRequestDTO: Encodable {
    public let universityName: String

    public init(universityName: String) {
        self.universityName = universityName
    }
}
