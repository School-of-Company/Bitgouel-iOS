import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public init(remoteClubDataSource: RemoteClubDataSource) {
        self.remoteClubDataSource = remoteClubDataSource
    }

    public func queryClubList() async throws -> [ClubEntity] {
        try await remoteClubDataSource.queryClubList()
    }

    public func queryClubDetail(clubId: String) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryClubDetail(clubId: clubId)
    }

    public func queryStudentListByClub() async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryStudentListByClub()
    }

    public func queryStudentDetailByClub(clubId: String, studentId: String) async throws -> StudentDetailByClubEntity {
        try await remoteClubDataSource.queryStudentDetailByClub(clubId: clubId, studentId: studentId)
    }
}
