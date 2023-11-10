import Foundation

public protocol LectureRepository {
    func lectureOpen(req: LectureOpenRequestDTO) async throws
    func lectureListInquiry() async throws
    func lectureApply(userID: String) async throws
    func waitingLectureApprove(userID: String) async throws
    func waitingLectureReject(userID: String) async throws
}
