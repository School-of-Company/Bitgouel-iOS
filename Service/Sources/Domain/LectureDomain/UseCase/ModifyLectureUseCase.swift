import Foundation

public protocol ModifyLectureUseCase {
    func callAsFunction(lectureID: String, req: InputLectureRequestDTO) async throws
}
