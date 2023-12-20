import Foundation

public protocol ClubRepository {
    func queryClubList() async throws
    func queryClubDetail(id: String) async throws
    func queryStudentListByClub(id: String) async throws
}
