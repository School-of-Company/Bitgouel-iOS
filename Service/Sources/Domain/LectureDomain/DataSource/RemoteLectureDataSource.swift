import Foundation

public protocol RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func openLecture(req: OpenLectureRequestDTO) async throws
    func fetchLectureList(type: String) async throws -> LectureContentEntity
    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity
    func applyLecture(lectureID: String) async throws
    func cancelLecture(lectureID: String) async throws
    func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity]
    func fetchLineList(keyword: String, division: String) async throws -> [String]
    func fetchDepartmentList(keyword: String) async throws -> [String]
    func fetchDivisionList(keyword: String) async throws -> [String]
    func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity]
    func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity]
    func modifyApplicantWhether(lectureID: String, studentID: String, isComplete: Bool) async throws
    func deleteLecture(lectureID: String) async throws
}
