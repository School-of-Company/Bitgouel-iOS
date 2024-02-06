import Foundation

public protocol RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func lectureOpen(req: LectureOpenRequestDTO) async throws
    func lectureListInquiry() async throws
    func lectureDetailInquiry(userID: String) async throws
    func lectureApply(userID: String) async throws
    func waitingLectureApprove(userID: String) async throws
    func waitingLectureReject(userID: String) async throws
}
