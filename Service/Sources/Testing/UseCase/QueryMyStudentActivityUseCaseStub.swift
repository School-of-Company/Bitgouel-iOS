import Foundation

public final class QueryMyStudentActivityUseCaseStub: QueryMyStudentActivityUseCase {
    public init() {}
    public func callAsFunction() async throws -> [ActivityEntity] {
        [
            ActivityEntity(
                activityID: "asd",
                title: "asdf",
                activityDate: "asdf",
                userID: .init(),
                userName: "asdf",
                approveStatus: .approve
            )
        ]
    }
}
