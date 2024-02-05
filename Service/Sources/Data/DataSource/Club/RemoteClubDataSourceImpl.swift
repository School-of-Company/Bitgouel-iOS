import Foundation

public final class RemoteClubDataSourceImpl: BaseRemoteDataSource<ClubAPI>, RemoteClubDataSource {
    public func queryClubList() async throws -> [ClubEntity] {
        try await request(.queryClubList, dto: ClubListResponseDTO.self)
            .toDomain()
    }

    public func queryClubDetail(clubId: String) async throws -> ClubDetailEntity {
        try await request(.queryClubDetail(clubId: clubId), dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentListByClub() async throws -> ClubDetailEntity {
        try await request(.queryStudentListByClub, dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentDetailByClub(clubId: String, studentId: String) async throws -> StudentDetailByClubEntity {
        try await request(
            .queryStudentDetailByClub(clubId: clubId, studentId: studentId),
            dto: StudentDetailByClubResponseDTO.self
        ).toDomain()
    }
}
