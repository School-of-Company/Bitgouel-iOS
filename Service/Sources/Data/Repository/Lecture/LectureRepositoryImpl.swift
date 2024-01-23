import Foundation

public struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    public init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }

    public func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await remoteLectureDataSource.lectureOpen(req: req)
    }

    public func lectureListInquiry() async throws {
        try await remoteLectureDataSource.lectureListInquiry()
    }

    public func lectureDetailInquiry(userID: String) async throws {
        try await remoteLectureDataSource.lectureDetailInquiry(userID: userID)
    }

    public func lectureApply(userID: String) async throws {
        try await remoteLectureDataSource.lectureApply(userID: userID)
    }

    public func waitingLectureApprove(userID: String) async throws {
        try await remoteLectureDataSource.waitingLectureApprove(userID: userID)
    }

    public func waitingLectureReject(userID: String) async throws {
        try await remoteLectureDataSource.waitingLectureReject(userID: userID)
    }
}
