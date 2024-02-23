import Foundation

public protocol LectureRepository {
    func lectureOpen(req: LectureOpenRequestDTO) async throws
    func queryLectureList() async throws -> [LectureListEntity]
    func queryLectureDetail(userID: String) async throws -> LectureDetailEntity
    func lectureApply(userID: String) async throws
    func lectureCancel(userID: String) async throws
}
