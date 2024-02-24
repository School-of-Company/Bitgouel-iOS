import Foundation

public final class RemoteClubDataSourceImpl: BaseRemoteDataSource<ClubAPI>, RemoteClubDataSource {
    public func queryClubList() async throws -> [ClubEntity] {
        try await request(.queryClubList, dto: ClubListResponseDTO.self)
            .toDomain()
    }

    public func queryClubDetail(clubID: String) async throws -> ClubDetailEntity {
        try await request(.queryClubDetail(clubID: clubID), dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentListByClub() async throws -> ClubDetailEntity {
        try await request(.queryStudentListByClub, dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentDetailByClub(clubID: String, studentID: String) async throws -> StudentDetailByClubEntity {
        try await request(
            .queryStudentDetailByClub(clubID: clubID, studentID: studentID),
            dto: StudentDetailByClubResponseDTO.self
        ).toDomain()
    }
}
