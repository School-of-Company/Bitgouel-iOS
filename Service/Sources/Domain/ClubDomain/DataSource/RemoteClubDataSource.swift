import Foundation

public protocol RemoteClubDataSource: BaseRemoteDataSource<ClubAPI> {
    func queryClubList() async throws -> ClubsEntity
    func queryClubDetail(id: String) async throws -> ClubDetailEntity
    func queryStudentListByClub(id: String) async throws -> StudentsEntity
}
