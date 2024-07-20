import Foundation

public protocol DeleteClubUseCase {
    func callAsFunction(clubID: Int) async throws
}
