import Foundation

public final class FetchActivityDetailUseCaseStub: FetchActivityDetailUseCase {
    public init() {}
    public func callAsFunction(activityID: String) async throws -> ActivityDetailEntity {
        ActivityDetailEntity(
            activityID: "asd",
            title: "국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는 이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다.",
            content: """
            청춘! 이는 듣기만 하여도 가슴이 설레는 말이다. 청춘! 너의 두 손을 가슴에 대고, 물방아 같은 심장의 고동을 들어 보라. 청춘의 피는 끓는다. 끓는 피에 뛰노는 심장은 거선(巨船)의 기관
            """,
            credit: 2,
            activityDate: Date(),
            modifiedAt: Date()
        )
    }
}
