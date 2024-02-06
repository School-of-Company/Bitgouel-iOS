import Foundation

public protocol QueryMyInfoUseCase {
    func callAsFunction() async throws -> MyInfoEntity
}
