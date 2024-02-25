import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public init(remoteClubDataSource: RemoteClubDataSource) {
        self.remoteClubDataSource = remoteClubDataSource
    }

    public func queryClubList(highSchool: String) async throws -> [ClubEntity] {
        try await remoteClubDataSource.queryClubList(highSchool: highSchool)
    }

    public func queryClubDetail(clubID: Int) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryClubDetail(clubID: clubID)
    }

    public func queryStudentListByClub() async throws -> ClubDetailEntity {
        try await remoteClubDataSource.queryStudentListByClub()
    }

    public func queryStudentDetailByClub(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity {
        try await remoteClubDataSource.queryStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
