import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public init(remoteClubDataSource: RemoteClubDataSource) {
        self.remoteClubDataSource = remoteClubDataSource
    }

    public func queryClubList() async throws -> [ClubEntity] {
        try await remoteClubDataSource.queryClubList()
    }

    public func queryClubDetail(clubID: String) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryClubDetail(clubID: clubID)
    }

    public func queryStudentListByClub() async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryStudentListByClub()
    }

    public func queryStudentDetailByClub(clubID: String, studentID: String) async throws -> StudentDetailByClubEntity {
        try await remoteClubDataSource.queryStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
