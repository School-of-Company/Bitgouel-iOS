import Foundation

public protocol DeleteSchoolUseCase {
    func callAsFunction(schoolID: String) async throws
}
