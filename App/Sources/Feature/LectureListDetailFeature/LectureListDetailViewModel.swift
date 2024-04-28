import Service
import SwiftUI

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment: Bool = false
    @Published var isApply: Bool = false
    @Published var isCancel: Bool = false
    @Published var isPresentedLectureApplicantListView: Bool = false
    @Published var userAuthority: UserAuthorityType = .user

    let lectureID: String
    private let fetchLectureDetailUseCase: any FetchLectureDetailUseCase
    private let applyLectureUseCase: any ApplyLectureUseCase
    private let cancelLectureUseCase: any CancelLectureUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        lectureID: String,
        fetchLectureDetailUseCase: any FetchLectureDetailUseCase,
        applyLectureUseCase: any ApplyLectureUseCase,
        cancelLectureUseCase: any CancelLectureUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.lectureID = lectureID
        self.fetchLectureDetailUseCase = fetchLectureDetailUseCase
        self.applyLectureUseCase = applyLectureUseCase
        self.cancelLectureUseCase = cancelLectureUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateIsErrorOccurred(state: Bool) {
        isErrorOccurred = state
    }

    func updateIsPresentedLectureApplicantView(isPresented: Bool) {
        isPresentedLectureApplicantListView = isPresented
    }

    @MainActor
    func onAppear() {
        isLoading = true

        userAuthority = loadUserAuthorityUseCase()

        Task {
            do {
                lectureDetail = try await fetchLectureDetailUseCase(lectureID: lectureID)

                isLoading = false
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
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
                isApply = false

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
