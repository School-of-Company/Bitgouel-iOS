import Foundation

public protocol FetchAllClubNameUseCase {
    func callAsFunction(schoolName: String) async throws -> [String]
}
