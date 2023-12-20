import Foundation

public protocol RemoteClubDataSource: BaseRemoteDataSource<ClubAPI> {
    func queryClubList() async throws
    func queryClubDetail(id: String) async throws
    func queryStudentListByClub(id: String) async throws
}
