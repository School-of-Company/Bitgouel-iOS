import Foundation

public final class QueryMyStudentActivityUseCaseStub: QueryMyStudentActivityUseCase {
    public init() {}
    public func callAsFunction() async throws -> [ActivityEntity] {
        [
            ActivityEntity(
                activityId: "asd",
                title: "asdf",
                activityDate: "asdf",
                userId: .init(),
                userName: "asdf",
                approveStatus: .approve
            )
        ]
    }
}
