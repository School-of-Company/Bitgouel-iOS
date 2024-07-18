import Foundation

public protocol DeleteUniversityUseCase {
    func callAsFunction(universityID: String) async throws
}
