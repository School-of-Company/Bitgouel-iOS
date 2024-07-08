import Foundation

public protocol OpenLectureUseCase {
    func callAsFunction(req: InputLectureRequestDTO) async throws
}
