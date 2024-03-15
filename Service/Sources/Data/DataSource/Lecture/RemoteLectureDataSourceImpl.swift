import Foundation

public final class RemoteLectureDataSourceImpl: BaseRemoteDataSource<LectureAPI>, RemoteLectureDataSource {
    public func openLecture(req: OpenLectureRequestDTO) async throws {
        try await request(.openLecture(req: req))
    }
    
    public func fetchLectureList(type: String) async throws -> [LectureListEntity] {
        try await request(.fetchLectureList(type: type), dto: FetchLectureListResponseDTO.self).toDomain()
    }
    
    public func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity {
        try await request(.fetchLectureDetail(lectureID: lectureID), dto: FetchLectureDetailResponseDTO.self).toDomain()
    }
    
    public func applyLecture(lectureID: String) async throws {
        try await request(.applyLecture(lectureID: lectureID))
    }
    
    public func cancelLecture(lectureID: String) async throws {
        try await request(.cancelLecture(lectureID: lectureID))
    }
    
    public func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity] {
        try await request(.fetchInstructorList(keyword: keyword), dto: FetchInstructorListResponseDTO.self).toDomain()
    }
    
    public func fetchDivisionList(keyword: String, division: String) async throws -> DivisionListEntity {
        try await request(.fetchDivisionList(keyword: keyword, division: division), dto: FetchDivisionListResponseDTO.self).toDomain()
    }
    
    public func fetchDepartmentList(keyword: String) async throws -> DepartmentListEntity {
        try await request(.fetchDepartmentList(keyword: keyword), dto: FetchDepartmentResponseDTO.self).toDomain()
    }
}
