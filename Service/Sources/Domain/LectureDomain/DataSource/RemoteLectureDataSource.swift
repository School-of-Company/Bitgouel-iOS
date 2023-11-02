import Foundation

final class RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await request(.lectureOpen(req))
    }
}
