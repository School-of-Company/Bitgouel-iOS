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
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
                isLoading = false
            }
        }
    }

    @MainActor
    func applyLecture() {
        Task {
            do {
                try await applyLectureUseCase(lectureID: lectureID)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
                isApply = false
            }
        }
    }

    func cancelLecture() {
        Task {
            do {
                try await cancelLectureUseCase(lectureID: lectureID)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
            }
        }
    }
}
