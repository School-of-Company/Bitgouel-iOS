import Foundation

public protocol LectureRepository {
    func openLecture(req: OpenLectureRequestDTO) async throws
    func fetchLectureList(type: String) async throws -> LectureContentEntity
    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity
    func applyLecture(lectureID: String) async throws
    func cancelLecture(lectureID: String) async throws
    func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity]
    func fetchDivisionList(keyword: String, division: String) async throws -> DivisionListEntity
    func fetchDepartmentList(keyword: String) async throws -> DepartmentListEntity
}
