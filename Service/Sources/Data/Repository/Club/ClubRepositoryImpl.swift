import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public func queryClubList() async throws -> ClubsEntity {
        try await remoteClubDataSource.queryClubList()
    }

    public func queryClubDetail(id: String) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryClubDetail(id: id)
    }

    public func queryStudentListByClub(id: String) async throws -> StudentsEntity {
        try await remoteClubDataSource.queryStudentListByClub(id: id)
    }
}
