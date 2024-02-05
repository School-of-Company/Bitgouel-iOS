import Foundation

public final class RemoteClubDataSourceImpl: BaseRemoteDataSource<ClubAPI>, RemoteClubDataSource {
    public func queryClubList() async throws -> [ClubEntity] {
        try await request(.queryClubList, dto: ClubListResponseDTO.self)
            .toDomain()
    }

    public func queryClubDetail(id: String) async throws -> ClubDetailEntity {
        try await request(.queryClubDetail(id: id), dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentListByClub() async throws -> [StudentEntity] {
        try await request(.queryStudentListByClub, dto: StudentListByClubResponseDTO.self)
            .toDomain()
    }
    
    public func queryStudentDetailByClub(id: String, studentId: String) async throws -> StudentDetailByClubEntity {
        try await request(.queryStudentDetailByClub(id: id, studentId: studentId), dto: StudentDetailByClubResponseDTO.self).toDomain()
    }
}
