import Foundation

public protocol LectureRepository {
    func onpenLecture(req: LectureOpenRequestDTO) async throws
    func fetchLectureList() async throws -> [LectureListEntity]
    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity
    func applyLecture(lectureID: String) async throws
    func cancelLecture(lectureID: String) async throws
    func fetchInstructorList(keyword: String) async throws -> InstructorInfoEntity
    func fetchDivisionList(keyword: String, division: DivisionType) -> DivisionListEntity
    func fetchDepartmentList(keyword: String) -> DepartmentListEntity
}
