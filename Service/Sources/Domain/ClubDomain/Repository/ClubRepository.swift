import Foundation

public protocol ClubRepository {
    func queryClubList(highSchool: String) async throws -> [ClubEntity]
    func queryClubDetail(clubID: String) async throws -> ClubDetailEntity
    func queryStudentListByClub() async throws -> ClubDetailEntity
    func queryStudentDetailByClub(clubID: String, studentID: String) async throws -> StudentDetailByClubEntity
}
