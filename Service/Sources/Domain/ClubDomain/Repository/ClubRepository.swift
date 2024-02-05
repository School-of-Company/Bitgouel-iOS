import Foundation

public protocol ClubRepository {
    func queryClubList() async throws -> [ClubEntity]
    func queryClubDetail(id: String) async throws -> ClubDetailEntity
    func queryStudentListByClub() async throws -> [StudentEntity]
    func queryStudentDetailByClub(id: String, studentId: String) async throws -> StudentDetailByClubEntity
}
