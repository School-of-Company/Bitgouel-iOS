import Foundation

public protocol RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func lectureOpen(req: LectureOpenRequestDTO) async throws
    func queryLectureList() async throws -> [LectureListEntity]
    func queryLectureDetail(userID: String) async throws
    func lectureApply(userID: String) async throws
    func lectureCancle(userID: String) async throws
}
