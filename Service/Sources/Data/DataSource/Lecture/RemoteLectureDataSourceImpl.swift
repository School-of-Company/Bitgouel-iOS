import Foundation

public final class RemoteLectureDataSourceImpl: BaseRemoteDataSource<LectureAPI>, RemoteLectureDataSource {
    public func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await request(.lectureOpen(req))
    }

    public func lectureListInquiry() async throws -> [LectureListEntity] {
        try await request(.lectureListInquiry, dto: FetchLectureListResponseDTO.self)
            .toDomain()
    }

    public func lectureDetailInquiry(userID: String) async throws {
        try await request(.lectureDetailInquiry(userID: userID))
    }

    public func lectureApply(userID: String) async throws {
        try await request(.lectureApply(userID: userID))
    }

    public func waitingLectureApprove(userID: String) async throws {
        try await request(.waitingLectureApprove(userID: userID))
    }

    public func waitingLectureReject(userID: String) async throws {
        try await request(.waitingLectureReject(userID: userID))
    }
}
