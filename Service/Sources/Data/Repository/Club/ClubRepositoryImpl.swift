import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public func queryClubList() async throws -> [ClubEntity] {
        try await remoteClubDataSource.queryClubList()
    }

    public func queryClubDetail(id: String) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryClubDetail(id: id)
    }

    public func queryStudentListByClub() async throws -> [StudentEntity] {
        try await remoteClubDataSource.queryStudentListByClub()
    }
}
