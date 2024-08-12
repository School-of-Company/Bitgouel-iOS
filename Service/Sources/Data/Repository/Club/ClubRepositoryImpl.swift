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

    public func createdClub(schoolID: Int, req: InputClubRequestDTO) async throws {
        try await remoteClubDataSource.createdClub(schoolID: schoolID, req: req)
    }

    public func modifyClub(clubID: Int, req: InputClubRequestDTO) async throws {
        try await remoteClubDataSource.modifyClub(clubID: clubID, req: req)
    }

    public func deleteClub(clubID: Int) async throws {
        try await remoteClubDataSource.deleteClub(clubID: clubID)
    }

    public func fetchAllClubName(schoolName: String) async throws -> [String] {
        try await remoteClubDataSource.fetchAllClubName(schoolName: schoolName)
    }
}
