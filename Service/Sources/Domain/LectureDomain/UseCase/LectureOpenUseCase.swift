import Foundation

public protocol LectureOpenUseCase {
    func callAsFunction(req: LectureOpenRequestDTO) async throws
}
