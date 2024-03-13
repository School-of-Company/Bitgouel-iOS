import Foundation

public protocol RemoteActivityDataSource: BaseRemoteDataSource<ActivityAPI> {
    func inputActivity(req: InputActivityRequestDTO) async throws
    func updateActibity(activityID: String, req: InputActivityRequestDTO) async throws
    func deleteActivity(activityID: String) async throws
    func fetchMyActivity() async throws -> ActivityContentEntity
    func fetchActivityByID(studentID: String) async throws -> ActivityContentEntity
    func fetchActivityList() async throws -> ActivityContentEntity
    func fetchActivityDetail(activityID: String) async throws -> ActivityDetailEntity
}
