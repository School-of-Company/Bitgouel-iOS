import Foundation

public final class RemoteActivityDataSourceImpl: BaseRemoteDataSource<ActivityAPI>, RemoteActivityDataSource {
    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await request(.addStudentActivity(req))
    }

    public func updateStudentActibity(activityId: String) async throws {
        try await request(.updateStudentActibity(activityId: activityId))
    }

    public func approveStudentActivity(activityId: String) async throws {
        try await request(.approveStudentActivity(activityId: activityId))
    }

    public func rejectStudentActivity(activityId: String) async throws {
        try await request(.rejectStudentActivity(activityId: activityId))
    }

    public func deleteStudentActivity(activityId: String) async throws {
        try await request(.deleteStudentActivity(activityId: activityId))
    }

    public func queryMyStudentActivity() async throws -> [ActivityEntity] {
        try await request(.queryMyStudentActivity, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityById(studentID: String) async throws -> [ActivityEntity] {
        try await request(.queryStudentActivityById(studentID: studentID), dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityList() async throws -> [ActivityEntity] {
        try await request(.queryStudentActivityList, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityDetails(activityId: String) async throws -> StudentActivityDetailEntity {
        try await request(.queryStudentActivityDetails(activityId: activityId), dto: StudentActivityDetailResponseDTO.self)
            .toDomain()
    }
}
