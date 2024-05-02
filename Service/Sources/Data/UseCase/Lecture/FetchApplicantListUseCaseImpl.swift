import Foundation

public struct FetchApplicantListUseCaseImpl: FetchApplicantListUseCase {
    private let lectureRepository: any LectureRepository

    public init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    public func callAsFunction(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await lectureRepository.fetchApplicantList(lectureID: lectureID)
    }
}
