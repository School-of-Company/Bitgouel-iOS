import Foundation

public struct FetchLineResponseDTO: Decodable {
    public let lines: [String]
    
    public init(lines: [String]) {
        self.lines = lines
    }
}

extension FetchLineResponseDTO {
    func toDomain() -> DivisionListEntity {
        DivisionListEntity(lines: lines)
    }
}
