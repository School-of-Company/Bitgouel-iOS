import Foundation

public protocol RemoteClubDataSource: BaseRemoteDataSource<ClubAPI> {
    func queryClubList() async throws -> [ClubEntity]
    func queryClubDetail(clubId: String) async throws -> ClubDetailEntity
    func queryStudentListByClub() async throws -> ClubDetailEntity
    func queryStudentDetailByClub(clubId: String, studentId: String) async throws -> StudentDetailByClubEntity
}
