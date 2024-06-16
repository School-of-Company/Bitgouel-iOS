import Foundation

public struct ClubRepositoryImpl: ClubRepository {
    private let remoteClubDataSource: RemoteClubDataSource

    public init(remoteClubDataSource: RemoteClubDataSource) {
        self.remoteClubDataSource = remoteClubDataSource
    }

    public func fetchClubList(highSchool: String) async throws -> [ClubEntity] {
        try await remoteClubDataSource.fetchClubList(highSchool: highSchool)
    }

    public func fetchClubDetail(clubID: Int) async throws -> ClubDetailEntity {
        try await remoteClubDataSource.fetchClubDetail(clubID: clubID)
    }

    public func fetchStudentListByClub() async throws -> ClubDetailEntity {
        try await remoteClubDataSource.fetchStudentListByClub()
    }

    public func fetchStudentDetailByClub(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity {
        try await remoteClubDataSource.fetchStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
