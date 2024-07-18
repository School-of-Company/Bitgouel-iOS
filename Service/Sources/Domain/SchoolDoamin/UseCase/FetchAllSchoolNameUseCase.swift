import Foundation

public protocol FetchAllSchoolNameUseCase {
    func callAsFunction() async throws -> [String]
}
