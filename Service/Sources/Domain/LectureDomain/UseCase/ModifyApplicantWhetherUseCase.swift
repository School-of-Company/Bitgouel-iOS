import Foundation

public protocol ModifyApplicantWhetherUseCase {
    func callAsFunction(lectureID: String, studentID: String, isComplete: Bool) async throws
}
