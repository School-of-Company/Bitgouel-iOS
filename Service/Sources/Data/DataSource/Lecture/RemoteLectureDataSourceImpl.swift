import Foundation

public final class RemoteLectureDataSourceImpl: BaseRemoteDataSource<LectureAPI>, RemoteLectureDataSource {
    public func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await request(.lectureOpen(req))
    }

    public func queryLectureList() async throws -> [LectureListEntity] {
        try await request(.queryLectureList, dto: FetchLectureListResponseDTO.self)
            .toDomain()
    }

    public func queryLectureDetail(userID: String) async throws {
        try await request(.queryLectureDetail(userID: userID))
    }

    public func lectureApply(userID: String) async throws {
        try await request(.lectureApply(userID: userID))
    }
}
