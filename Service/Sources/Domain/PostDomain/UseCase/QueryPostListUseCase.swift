import Foundation

public protocol QueryPostListUseCase {
    func callAsFunction() async throws -> [PostEntity]
}
