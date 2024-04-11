import Foundation

public final class QueryClubDetailUseCaseStub: QueryClubDetailUseCase {
    public init() {}
    public func callAsFunction(clubID: Int) async throws -> ClubDetailEntity {
        ClubDetailEntity(
            clubID: 0,
            clubName: "devGSM",
            highSchoolName: "광주소프트웨어마이스터고등학교",
            students: [
                .init(userID: "", studentID: "1", name: "김학생"),
                .init(userID: "", studentID: "2", name: "정학생"),
                .init(userID: "", studentID: "4", name: "안녕")
            ],
            teacher: .init(teacherID: "3", name: "김선생")
        )
    }
}
