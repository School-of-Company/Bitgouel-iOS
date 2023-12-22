import Foundation

public final class RemoteActivityDataSourceImpl: BaseRemoteDataSource<ActivityAPI>, RemoteActivityDataSource {
    public func addStudentActivity(req: AddStudentActivityRequestDTO) async throws {
        try await request(.addStudentActivity(req))
    }

    public func updateStudentActibity(userID: String) async throws {
        try await request(.updateStudentActibity(userID: userID))
    }

    public func approveStudentActivity(userID: String) async throws {
        try await request(.approveStudentActivity(userID: userID))
    }

    public func rejectStudentActivity(userID: String) async throws {
        try await request(.rejectStudentActivity(userID: userID))
    }

    public func deleteStudentActivity(userID: String) async throws {
        try await request(.deleteStudentActivity(userID: userID))
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

    public func queryStudentActivityDetails(userID: String) async throws -> StudentActivityDetailEntity {
        try await request(.queryStudentActivityDetails(userID: userID), dto: StudentActivityDetailResponseDTO.self)
            .toDomain()
    }
}
