import Foundation

public final class RemoteActivityDataSourceImpl: BaseRemoteDataSource<ActivityAPI>, RemoteActivityDataSource {
    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await request(.addStudentActivity(req))
    }

    public func updateStudentActibity(activityID: String) async throws {
        try await request(.updateStudentActibity(activityID: activityID))
    }

    public func approveStudentActivity(activityID: String) async throws {
        try await request(.approveStudentActivity(activityID: activityID))
    }

    public func rejectStudentActivity(activityID: String) async throws {
        try await request(.rejectStudentActivity(activityID: activityID))
    }

    public func deleteStudentActivity(activityID: String) async throws {
        try await request(.deleteStudentActivity(activityID: activityID))
    }

    public func queryMyStudentActivity() async throws -> ActivityContentEntity {
        try await request(.queryMyStudentActivity, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await request(.queryStudentActivityByID(studentID: studentID), dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityList() async throws -> ActivityContentEntity {
        try await request(.queryStudentActivityList, dto: ActivitiesResponseDTO.self)
            .toDomain()
    }

    public func queryStudentActivityDetails(activityID: String) async throws -> StudentActivityDetailEntity {
        try await request(
            .queryStudentActivityDetails(activityID: activityID),
            dto: StudentActivityDetailResponseDTO.self
        )
        .toDomain()
    }
}
