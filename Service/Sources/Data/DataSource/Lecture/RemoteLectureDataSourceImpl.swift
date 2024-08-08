import Foundation

public final class RemoteLectureDataSourceImpl: BaseRemoteDataSource<LectureAPI>, RemoteLectureDataSource {
    public func openLecture(req: InputLectureRequestDTO) async throws {
        try await request(.openLecture(req: req))
    }

    public func fetchLectureList(type: String) async throws -> LectureContentEntity {
        try await request(.fetchLectureList(type: type), dto: FetchLectureListResponseDTO.self).toDomain()
    }

    public func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity {
        try await request(.fetchLectureDetail(lectureID: lectureID), dto: FetchLectureDetailResponseDTO.self).toDomain()
    }

    public func applyLecture(lectureID: String) async throws {
        try await request(.applyLecture(lectureID: lectureID))
    }

    public func cancelLectureApplication(lectureID: String) async throws {
        try await request(.cancelLectureApplication(lectureID: lectureID))
    }

    public func searchInstructor(keyword: String) async throws -> [InstructorInfoEntity] {
        try await request(.searchInstructor(keyword: keyword), dto: FetchInstructorListResponseDTO.self).toDomain()
    }

    public func searchLine(keyword: String, division: String) async throws -> [String] {
        try await request(.searchLine(keyword: keyword, division: division), dto: FetchLineListResponseDTO.self)
            .lines
    }

    public func searchDepartment(keyword: String) async throws -> [String] {
        try await request(.searchDepartment(keyword: keyword), dto: FetchDepartmentResponseDTO.self).departments
    }

    public func searchDivision(keyword: String) async throws -> [String] {
        try await request(.searchDivision(keyword: keyword), dto: FetchDivisionListResponseDTO.self).divisions
    }

    public func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity] {
        try await request(.fetchAppliedLectureList(studentID: studentID), dto: FetchAppliedLectureListResponseDTO.self)
            .toDomain()
    }

    public func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await request(.fetchApplicantList(lectureID: lectureID), dto: FetchApplicantListResponseDTO.self).toDomain()
    }

    public func setLectureCompletion(lectureID: String, students: String) async throws {
        try await request(.setLectureCompletion(lectureID: lectureID, students: students))
    }

    public func deleteLecture(lectureID: String) async throws {
        try await request(.deleteLecture(lectureID: lectureID))
    }

    public func modifyLecture(lectureID: String, req: InputLectureRequestDTO) async throws {
        try await request(.modifyLecture(lectureID: lectureID, req: req))
    }

    public func fetchAppliedLectureStudentDetail(
        lectureID: String,
        studentID: String
    ) async throws -> AppliedLectureStudentDetailEntity {
        try await request(.fetchAppliedLectureStudentDetail(lectureID: lectureID, studentID: studentID), dto: AppliedLectureStudentDetailResponseDTO.self).toDomain()
    }
}
