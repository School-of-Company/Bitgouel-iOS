import Foundation

public protocol FetchSchoolDetailUseCase {
    func callAsFunction(schoolID: Int) async throws -> SchoolListEntity
}
