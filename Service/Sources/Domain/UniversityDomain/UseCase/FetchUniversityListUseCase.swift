import Foundation

public protocol FetchUniversityListUseCase {
    func callAsFunction() async throws -> [UniversityInfoEntity]
}
