import Foundation

public protocol DeleteSchoolUseCase {
    func callAsFunction(schoolID: Int) async throws
}
