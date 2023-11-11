import Foundation

final class RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func lectureOpen(req: LectureOpenRequestDTO) async throws {
        try await request(.lectureOpen(req))
    }

    func lectureListInquiry() async throws {
        try await request(.lectureListInquiry)
    }
    
    func lectureDetailInquiry(userID: String) async throws {
        try await request(.lectureDetailInquiry(userID: userID))
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
