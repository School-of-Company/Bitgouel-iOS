import Foundation

public final class RemoteClubDataSourceImpl: BaseRemoteDataSource<ClubAPI>, RemoteClubDataSource {
    public func queryClubList() async throws -> ClubsEntity {
        try await request(.queryClubList, dto: ClubListResponseDTO.self)
            .toDomain()
    }

    public func queryClubDetail(id: String) async throws -> ClubDetailEntity {
        try await request(.queryClubDetail(id: id), dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func queryStudentListByClub(id: String) async throws -> StudentsEntity {
        try await request(.queryStudentListByClub(id: id), dto: StudentListByClubResponseDTO.self)
            .toDomain()
    }
}
