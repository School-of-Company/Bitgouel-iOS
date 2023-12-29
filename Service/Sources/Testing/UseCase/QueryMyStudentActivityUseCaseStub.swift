import Foundation

public final class QueryMyStudentActivityUseCaseStub: QueryMyStudentActivityUseCase {
    public init() {}
    public func callAsFunction() async throws -> [ActivityEntity] {
        [
            ActivityEntity(
                activityId: .init(),
                title: "asdf",
                activityDate: "asdf",
                userId: .init(),
                userName: "asdf",
                approveStatus: .approve
            )
        ]
    }
}
