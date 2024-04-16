import Service
import SwiftUI

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment = false
    @Published var isApply = false
    @Published var isCancel = false

    private let lectureID: String
    private let fetchLectureDetailUseCase: any FetchLectureDetailUseCase
    private let applyLectureUseCase: any ApplyLectureUseCase
    private let cancelLectureUseCase: any CancelLectureUseCase

    init(
        lectureID: String,
        fetchLectureDetailUseCase: any FetchLectureDetailUseCase,
        applyLectureUseCase: any ApplyLectureUseCase,
        cancelLectureUseCase: any CancelLectureUseCase
    ) {
        self.lectureID = lectureID
        self.fetchLectureDetailUseCase = fetchLectureDetailUseCase
        self.applyLectureUseCase = applyLectureUseCase
        self.cancelLectureUseCase = cancelLectureUseCase
    }

    func updateIsErrorOccurred(state: Bool) {
        isErrorOccurred = state
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                lectureDetail = try await fetchLectureDetailUseCase(lectureID: lectureID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func applyLecture() {
        Task {
            do {
                try await applyLectureUseCase(lectureID: lectureID)
            } catch {
                if let lectureDomainError = error as? LectureDomainError {
                    errorMessage = lectureDomainError.errorDescription ?? "알 수 없는 오류가 발생했습니다."
                } else {
                    errorMessage = "알 수 없는 오류가 발생했습니다."
                }
                updateIsErrorOccurred(state: true)

                print(error.localizedDescription)
            }
        }
    }

    func cancelLecture() {
        Task {
            do {
                try await cancelLectureUseCase(lectureID: lectureID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
