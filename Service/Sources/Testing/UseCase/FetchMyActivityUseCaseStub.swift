import Foundation

public final class QueryMyStudentActivityUseCaseStub: QueryMyStudentActivityUseCase {
    public init() {}
    public func callAsFunction() async throws -> ActivityContentEntity {
            ActivityContentEntity(
                content: [ActivityEntity(
                    activityID: "",
                    title: "타이틀",
                    activityDate: "ㅇㄹㅇㄹ",
                    userID: "ㅇㅇㄹㅇㄹ",
                    userName: "안녕"
                )]
            )
    }
}
