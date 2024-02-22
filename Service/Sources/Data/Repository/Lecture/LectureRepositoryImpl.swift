import Foundation

public struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    public init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }

    public func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await remoteLectureDataSource.lectureOpen(req: req)
    }

    public func queryLectureList() async throws -> [LectureListEntity] {
        try await remoteLectureDataSource.queryLectureList()
    }

    public func queryLectureDetail(userID: String) async throws {
        try await remoteLectureDataSource.queryLectureDetail(userID: userID)
    }

    public func lectureApply(userID: String) async throws {
        try await remoteLectureDataSource.lectureApply(userID: userID)
    }
    
    public func lectureCancle(userID: String) async throws {
        try await remoteLectureDataSource.lectureCancle(userID: userID)
    }
}
