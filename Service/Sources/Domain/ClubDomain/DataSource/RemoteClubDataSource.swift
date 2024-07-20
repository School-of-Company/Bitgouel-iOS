import Foundation

public protocol RemoteClubDataSource: BaseRemoteDataSource<ClubAPI> {
    func fetchClubList(highSchool: String) async throws -> [ClubEntity]
    func fetchClubDetail(clubID: Int) async throws -> ClubDetailEntity
    func fetchStudentListByClub() async throws -> ClubDetailEntity
    func fetchStudentDetailByClub(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity
    func createdClub(schoolID: String, req: CreatedClubRequestDTO) async throws
    func modifyClub(clubID: Int, req: ModifyClubRequestDTO) async throws
    func deleteClub(clubID: Int) async throws
}
