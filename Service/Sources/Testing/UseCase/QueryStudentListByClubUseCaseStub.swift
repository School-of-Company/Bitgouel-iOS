import Foundation

public final class QueryStudentListByClubUseCaseStub: QueryStudentListByClubUseCase {
    public init() {}
    public func callAsFunction() async throws -> ClubDetailEntity {
        ClubDetailEntity(
            clubID: 0,
            clubName: "devGSM",
            highSchoolName: "광주소프트웨어마이스터고등학교",
            students: [
                .init(studentID: "1", name: "김학생"),
                .init(studentID: "2", name: "정학생"),
                .init(studentID: "4", name: "안녕")
            ],
            teacher: .init(studentID: "4", name: "한선생")
        )
    }
}
