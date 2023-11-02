import Foundation

public protocol LectureRepository {
    func lectureOpen(req: LectureOpenRequestDTO) async throws
}
