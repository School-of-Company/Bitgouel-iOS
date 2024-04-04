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

    public func fetchLineList(keyword: String, line: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchLineList(keyword: keyword, line: line)
    }

    public func fetchDepartmentList(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchDepartmentList(keyword: keyword)
    }
}
