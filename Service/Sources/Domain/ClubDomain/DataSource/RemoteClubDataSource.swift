import Foundation

public protocol RemoteClubDataSource: BaseRemoteDataSource<ClubAPI> {
    func queryClubList(highSchool: String) async throws -> [ClubEntity]
    func queryClubDetail(clubID: Int) async throws -> ClubDetailEntity
    func queryStudentListByClub() async throws -> ClubDetailEntity
    func queryStudentDetailByClub(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity
}
