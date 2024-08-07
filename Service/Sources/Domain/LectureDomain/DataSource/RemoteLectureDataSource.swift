import Foundation

public protocol RemoteLectureDataSource: BaseRemoteDataSource<LectureAPI> {
    func openLecture(req: InputLectureRequestDTO) async throws
    func fetchLectureList(type: String) async throws -> LectureContentEntity
    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity
    func applyLecture(lectureID: String) async throws
    func cancelLectureApplication(lectureID: String) async throws
    func searchInstructor(keyword: String) async throws -> [InstructorInfoEntity]
    func searchLine(keyword: String, division: String) async throws -> [String]
    func searchDepartment(keyword: String) async throws -> [String]
    func searchDivision(keyword: String) async throws -> [String]
    func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity]
    func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity]
    func setLectureCompletion(lectureID: String, students: [String]) async throws
    func deleteLecture(lectureID: String) async throws
    func modifyLecture(lectureID: String, req: InputLectureRequestDTO) async throws
}
