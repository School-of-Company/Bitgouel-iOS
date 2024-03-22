import Foundation

public struct FetchEmailVerificationStatusResponseDTO: Decodable {
    public let isAuthentication: Bool
    
    public init(isAuthentication: Bool) {
        self.isAuthentication = isAuthentication
    }
}

extension FetchEmailVerificationStatusResponseDTO {
    func toDomain() -> EmailVerificationStatusEntity {
        EmailVerificationStatusEntity(isAuthentication: isAuthentication)
    }
}
