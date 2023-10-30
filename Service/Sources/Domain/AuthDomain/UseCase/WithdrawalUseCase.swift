import Foundation

public protocol WithdrawalUseCase {
    func execute() async throws
}
