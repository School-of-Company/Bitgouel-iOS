import Foundation

public struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    public init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }

    public func openLecture(req: OpenLectureRequestDTO) async throws {
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

    public func cancelLecture(lectureID: String) async throws {
        try await remoteLectureDataSource.cancelLecture(lectureID: lectureID)
    }

    public func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity] {
        try await remoteLectureDataSource.fetchInstructorList(keyword: keyword)
    }

    public func fetchLineList(keyword: String, division: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchLineList(keyword: keyword, division: division)
    }

    public func fetchDepartmentList(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchDepartmentList(keyword: keyword)
    }

    public func fetchDivisionList(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchDivisionList(keyword: keyword)
    }

    public func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity] {
        try await remoteLectureDataSource.fetchAppliedLectureList(studentID: studentID)
    }

    public func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await remoteLectureDataSource.fetchApplicantList(lectureID: lectureID)
    }

    public func modifyApplicantWhether(lectureID: String, studentID: String, isComplete: Bool) async throws {
        try await remoteLectureDataSource.modifyApplicantWhether(
            lectureID: lectureID,
            studentID: studentID,
            isComplete: isComplete
        )
    }
}
