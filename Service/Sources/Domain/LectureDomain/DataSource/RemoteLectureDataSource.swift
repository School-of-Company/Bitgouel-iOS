import Foundation

final class RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await request(.lectureOpen(req))
    }

    func lectureApply(userID: String) async throws {
        try await request(.lectureApply(userID: userID))
    }

    func waitingLectureApprove(userID: String) async throws {
        try await request(.waitingLectureApprove(userID: userID))
    }
    
    func waitingLectureReject(userID: String) async throws {
        try await request(.waitingLectureReject(userID: userID))
    }
}
