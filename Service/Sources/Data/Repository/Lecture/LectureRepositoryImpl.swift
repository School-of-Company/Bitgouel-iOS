import Foundation

struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }
}
