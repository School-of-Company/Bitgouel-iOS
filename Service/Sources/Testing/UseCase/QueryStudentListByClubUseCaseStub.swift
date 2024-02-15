import Foundation

public final class QueryStudentListByClubUseCaseStub: QueryStudentListByClubUseCase {
    public init() {}
    public func callAsFunction() async throws -> ClubDetailEntity {
        ClubDetailEntity(
            clubId: .init(),
            clubName: "devGSM",
            highSchoolName: "광주소프트웨어마이스터고등학교",
            headcount: 0,
            students: [
                .init(id: "1", name: "김학생"),
                .init(id: "2", name: "정학생"),
                .init(id: "4", name: "안녕")
            ],
            teacher: .init(id: "4", name: "한선생")
        )
    }
}
