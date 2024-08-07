import Foundation

public struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    public init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }

    public func openLecture(req: InputLectureRequestDTO) async throws {
        try await remoteLectureDataSource.openLecture(req: req)
    }

    public func fetchLectureList(type: String) async throws -> LectureContentEntity {
        try await remoteLectureDataSource.fetchLectureList(type: type)
    }

    public func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity {
        try await remoteLectureDataSource.fetchLectureDetail(lectureID: lectureID)
    }

    public func applyLecture(lectureID: String) async throws {
        try await remoteLectureDataSource.applyLecture(lectureID: lectureID)
    }

    public func cancelLectureApplication(lectureID: String) async throws {
        try await remoteLectureDataSource.cancelLectureApplication(lectureID: lectureID)
    }

    public func searchInstructor(keyword: String) async throws -> [InstructorInfoEntity] {
        try await remoteLectureDataSource.searchInstructor(keyword: keyword)
    }

    public func searchLine(keyword: String, division: String) async throws -> [String] {
        try await remoteLectureDataSource.searchLine(keyword: keyword, division: division)
    }

    public func searchDepartment(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.searchDepartment(keyword: keyword)
    }

    public func searchDivision(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.searchDivision(keyword: keyword)
    }

    public func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity] {
        try await remoteLectureDataSource.fetchAppliedLectureList(studentID: studentID)
    }

    public func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await remoteLectureDataSource.fetchApplicantList(lectureID: lectureID)
    }

    public func setLectureCompletion(lectureID: String, students: [String]) async throws {
        try await remoteLectureDataSource.setLectureCompletion(lectureID: lectureID, students: students)
    }

    public func deleteLecture(lectureID: String) async throws {
        try await remoteLectureDataSource.deleteLecture(lectureID: lectureID)
    }

    public func modifyLecture(lectureID: String, req: InputLectureRequestDTO) async throws {
        try await remoteLectureDataSource.modifyLecture(lectureID: lectureID, req: req)
    }

    public func fetchAppliedLectureStudentDetail(lectureID: String, studentID: String) async throws -> AppliedLectureStudentDetailEntity {
        try await remoteLectureDataSource.fetchAppliedLectureStudentDetail(lectureID: lectureID, studentID: studentID)
    }
}
