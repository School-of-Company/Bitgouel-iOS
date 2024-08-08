import Foundation

struct AppliedLectureStudentDetailResponseDTO: Decodable {
    public let email: String
    public let name: String
    public let grade: Int
    public let classNumber: Int
    public let number: Int
    public let phoneNumber: String
    public let school: String
    public let clubName: String
    public let cohort: Int
    public let currentCompletedDate: Date
    public let completeStatus: CompleteStatusType
}

extension AppliedLectureStudentDetailResponseDTO {
    func toDomain() -> AppliedLectureStudentDetailEntity {
        AppliedLectureStudentDetailEntity(
            email: email,
            name: name,
            grade: grade,
            classNumber: classNumber,
            number: number,
            phoneNumber: phoneNumber,
            school: school,
            clubName: clubName,
            cohort: cohort,
            currentCompletedDate: currentCompletedDate,
            completeStatus: completeStatus
        )
    }
}
