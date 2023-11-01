import Foundation

struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }
    
    public func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await remoteLectureDataSource.lectureOpen(req: req)
    }
}
