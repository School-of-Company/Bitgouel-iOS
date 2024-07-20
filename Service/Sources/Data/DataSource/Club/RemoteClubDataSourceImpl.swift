import Foundation

public final class RemoteClubDataSourceImpl: BaseRemoteDataSource<ClubAPI>, RemoteClubDataSource {
    public func fetchClubList(highSchool: String) async throws -> [ClubEntity] {
        try await request(.fetchClubList(highSchool: highSchool), dto: ClubListResponseDTO.self)
            .toDomain()
    }

    public func fetchClubDetail(clubID: Int) async throws -> ClubDetailEntity {
        try await request(.fetchClubDetail(clubID: clubID), dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func fetchStudentListByClub() async throws -> ClubDetailEntity {
        try await request(.fetchStudentListByClub, dto: ClubDetailResponseDTO.self)
            .toDomain()
    }

    public func fetchStudentDetailByClub(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity {
        try await request(
            .fetchStudentDetailByClub(clubID: clubID, studentID: studentID),
            dto: StudentDetailByClubResponseDTO.self
        ).toDomain()
    }

    public func createdClub(schoolID: String, req: CreatedClubRequestDTO) async throws {
        try await request(.createdClub(schoolID: schoolID, req: req))
    }

    public func modifyClub(clubID: Int, req: ModifyClubRequestDTO) async throws {
        try await request(.modifyClub(clubID: clubID, req: req))
    }

    public func deleteClub(clubID: Int) async throws {
        try await request(.deleteClub(clubID: clubID))
    }
}
