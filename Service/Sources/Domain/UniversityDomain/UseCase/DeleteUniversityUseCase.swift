import Foundation

public protocol DeleteUniversityUseCase {
    func callAsFunction(universityID: Int) async throws
}
